package com.tju.fast.ocs.schedule;


import com.tju.fast.ocs.po.Fastproposal;
import com.tju.fast.ocs.po.MSB;
import com.tju.fast.ocs.po.Observation;
import com.tju.fast.ocs.po.ScheduleSlot;
import com.tju.fast.ocs.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class ScheduleProc {

    /**
     * msbNum:		msb的数量
     * timeNum:		可用时间片的数量
     * pref:		非负数，某msb在某时间片的偏好值
     * R:			系数
     * capacity:	非负数，某msb在某时间片的容量
     * ansList[i]:	保存第i个msb对应调度时间的角标
     */
    final int MAXM = 2500;
    private int msbNum;
    private int timeNum;
    Double pref;
    Double R;
    Integer capacity;
    MinCostMaxFlow F = new MinCostMaxFlow();
    public ArrayList<Ans> ansList = new ArrayList<Ans>();
    public boolean[] haveEdge = new boolean[MAXM];

    @Autowired
    IProposalService propSvc;

    @Autowired
    IMSBService msbSvc;

    @Autowired
    ISchedulingService sSvc;

    @Autowired
    IScheduleslotService sslotSvc;

    @Autowired
    IObservationService obsSvc;

    private int getTNum() {
        // TODO Auto-generated method stub
        return timeNum;
    }

    private int getMNum() {
        // TODO Auto-generated method stub
        return msbNum;
    }

    /**
     * msb关于科学价值限制的偏好
     *
     * @param msb
     * @return
     */
    private Double rate(MSB msb) {
        // TODO Auto-generated method stub
        String id = msb.getPropid();
        Fastproposal p = propSvc.selectById(id);

        return p.getRate();
    }

    /**
     * msb关于优先级限制的偏好
     *
     * @param msb
     * @return
     */
    private Double priority(MSB msb) {
        // TODO Auto-generated method stub
        return msb.getPriority();
    }

    /**
     * @param msb msb关于最佳观测时间限制的偏好
     */
    private void bestTime(MSB msb, ScheduleSlot lot) {
        // TODO Auto-generated method stub
        Date begin = new Date(msb.getBegintime().getTime());
        Date end = new Date(msb.getEndtime().getTime());
        int i = 0;
        if (begin.after(lot.getBegintime()) == false && end.before(lot.getEndtime()) == false) {
            capacity = 1;
        }
    }

    /**
     * msb关于天气限制的偏好
     *
     * @param msb
     */
    private void weather(MSB msb, ScheduleSlot lot) {
        // TODO Auto-generated method stub
        pref *= 1.0;
    }

    /**
     * msb关于强源距离限制在每个可用时间片的偏好
     *
     * @param msb
     */
    private void strongSource(MSB msb, ScheduleSlot lot) {
        // TODO Auto-generated method stub
        pref *= 1.0;
    }

    /**
     * @param msb msb关于中天距离限制在每个可用时间片的偏好
     */
    private void distance(MSB msb, ScheduleSlot lot) {
        // TODO Auto-generated method stub
        if (capacity == 1) {
            List<Observation> ListOb = obsSvc.selectListByMSBId(msb.getId());
            int sFlag, tFlag;
            double sALT, tALT, tmp = 0;
            for (Observation m : ListOb) {
                Double ra = Double.parseDouble(m.getRa2000());
                Double dec = Double.parseDouble(m.getDec2000());
                ToALT_AZ ob = new ToALT_AZ(ra, dec, lot.getBegintime());
                sFlag = ob.isInside();
                sALT = ob.getALT();
                ob = new ToALT_AZ(ra, dec, lot.getEndtime());
                tFlag = ob.isInside();
                tALT = ob.getALT();
                if (sFlag > 0 && tFlag > 0) {
                    tmp += ((sALT + tALT) / 2.0);
                }
            }
            if (tmp > 0) {
                pref *= Math.exp(tmp);
            } else {
                pref = 0.0;
            }
        }
    }

    /**
     * @param msb
     * @param ind 根据第ind个msb关于每个时间片的偏好值，建边
     */
    public void edgeProc(MSB msb, ScheduleSlot lot, int ind) {
        capacity = 0;
        pref = 1.0;
        bestTime(msb, lot);
        weather(msb, lot);
        strongSource(msb, lot);
        //TODO remove comment in case of productivity environment
        //distance(msb, lot);
    }

    /**
     * @param msb
     * @param ind 根据第ind个msb的repeatCounts，建源点到msb的边
     */
    private void sEdge(MSB msb, int ind) {
        // TODO Auto-generated method stub
        F.addEdge(0, ind, msb.getRepeatcounts(), 0.0);
    }

    /**
     * 建时间片到汇点的边
     */
    private void tEdge() {
        // TODO Auto-generated method stub
        for (int i = 1; i <= getTNum(); i++) {
            F.addEdge(i + getMNum(), getMNum() + getTNum() + 1, 1, 0.0);
        }
    }

    /**
     * 清空单向链表ansList
     */
    public void ansClear() {
        for (Ans m3 : ansList) {
            m3.clear();
        }
        ansList.clear();
    }

    public void work() {
        //读取msb和可用时间片
        List<MSB> listMSB = msbSvc.selectList(null);
        this.msbNum = listMSB.size();
        List<ScheduleSlot> listTime = sslotSvc.selectList(null);
        this.timeNum = listTime.size();

        //建图
        F.init(0, getMNum() + getTNum() + 1);
        Arrays.fill(haveEdge, false);
        int i = 1;
        for (MSB m1 : listMSB) {
            sEdge(m1, i);
            R = -1.0;
            R *= rate(m1);
            R *= priority(m1);
            int j = 1;
            for (ScheduleSlot m2 : listTime) {
                edgeProc(m1, m2, i);
                if (capacity > 0 && pref > 0) {
                    F.addEdge(i, getMNum() + j, capacity, R * pref);
                    haveEdge[i] = true;
                }
                j++;
            }
            i++;
        }
        tEdge();

        //调度
        F.solve();

        //用ansList保存调度结果
        Ans tmp;
        int u = 1;
        for (MSB m1 : listMSB) {
            if (haveEdge[u] == false) {
                continue;
            }
            tmp = new Ans();
            tmp.setMsbId(m1.getId());
            for (int v = F.head[u]; v != -1; v = F.edge[v].getNext()) {
                if (F.edge[v].getCapacity() == 0) {
                    tmp.addSlotId(listTime.get(F.edge[v].getTo() - getMNum() - 1).getId());
                }
            }
            if (tmp.size() > 0) {
                ansList.add(tmp);
                Iterator<String> it = tmp.iterator();
                while (it.hasNext()) {
                    String ssss = it.next();
                }
            }
            u++;
        }
    }


}
