package com.tju.fast.ocs.controller;

import com.baomidou.mybatisplus.mapper.Condition;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.tju.fast.ocs.connection.ObsOrderUtils;
import com.tju.fast.ocs.po.*;
import com.tju.fast.ocs.schedule.Ans;
import com.tju.fast.ocs.schedule.ScheduleProc;
import com.tju.fast.ocs.util.DateUtils;
import com.tju.fast.ocs.util.Pair;
import com.tju.fast.ocs.util.StringUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class MSBController extends BaseController {

    private Logger logger = getLogger(MSBController.class);

    @Autowired
    ScheduleProc sp;

    @Resource(name = "NewObs")
    ObsOrderUtils NewObs;

    /**
     * 载入MSB页面
     *
     * @param session
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/msb")
    public String msb(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setAttribute("proplist", propSvc.selectList(null));
        return "msb";
    }

    /**
     * 输出MSB列表ＪＳＯＮ数据
     *
     * @param session
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/msb/data")
    public String loadData(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        try {
            String str = request.getParameter("search");
            Pair<String, List<Object>> sql = advancedSearchSQLGen(str);
            List<MSB> list = msbSvc.selectList(Condition.create().where(sql.first, (Object[]) sql.second.toArray()));
            //construct json string
            JSONArray jarrout = new JSONArray();
            for (MSB m : list) {
                //Scheduled
                List<Scheduling> schlist = sSvc.selectListByMSBIds(Lists.newArrayList(m.getId()));
                for (int i = 0; i < schlist.size(); i++) {
                    Scheduling sching = schlist.get(i);
                    String slotid = sching.getSsltid();
                    if (StringUtils.isEmpty(slotid)) {
                        continue;
                    }
                    ScheduleSlot slot = sslotSvc.selectById(slotid);
                    if (slot == null) {
                        continue;
                    }
                    JSONObject o = new JSONObject();
                    o.accumulate("id", m.getId());
                    o.accumulate("title", m.getTitle());
                    o.accumulate("start", DateUtils.getSimpleDate(slot.getBegintime()));
                    o.accumulate("end", DateUtils.getSimpleDate(slot.getEndtime()));
                    o.accumulate("status", sching.getStatus());
                    //added
                    o.accumulate("msbid_rc", sching.getMsbidRepeatcount());
                    o.accumulate("propid", m.getPropid());
                    o.accumulate("note", m.getNote());
                    jarrout.add(o);
                }

            }
            return writeJSONSuccResponse(response, jarrout);
        } catch (Exception e) {
            logger.error(e.toString());
            return writeJSONErrorResponse(response, e.toString());
        }
    }

    /**
     * 输出MSB Detail JSON数据
     *
     * @param session
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/msb/detail")
    public String loadMSBDetail(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        try {
            String str = request.getParameter("msbid");
            if (!StringUtils.isEmpty(str)) {
                MSB msb = msbSvc.selectById(str);
                List<Observation> obslist = obsSvc.selectList(Condition.create().eq("msbid", msb.getId()));
                JSONObject json = JSONObject.fromObject(msb);
                JSONArray jarr = JSONArray.fromObject(obslist);
                json.accumulate("observations", jarr);
                List<Scheduling> slist = sSvc.selectListByMSBIds(Lists.newArrayList(msb.getId()));
                int observedcounts = 0;
                Double observedtime = 0.0;
                String status = "0";
                for (Scheduling s : slist) {
                    observedcounts += s.getObservedcounts();
                    observedtime += s.getObservedtime();
                    if (s.getStatus().equals("1")) {
                        status = "1";
                    } else if (s.getStatus().equals("2") && status.equals("0")) {
                        status = "2";
                    }
                }
                json.accumulate("observedcounts", observedcounts);
                json.accumulate("observedtime", observedtime);
                json.accumulate("status", status);
                //instruction
                List<Scheduling> _slist = sSvc.selectListByMSBIds(Lists.newArrayList(msb.getId()));
                List<ObsOrder> orders = generateObsOrders(_slist);
                List<String> instStrList = new ArrayList<String>();
                for (int i = 0; i < orders.size(); i++) {
                    instStrList.add(NewObs.getObsLine(i, orders));
                }
                json.accumulate("instructions", instStrList);
                return writeJSONSuccResponse(response, json);
            }
            return writeJSONErrorResponse(response, "wrong parameter.");
        } catch (Exception e) {
            logger.error(e.toString());
            return writeJSONErrorResponse(response, e.toString());
        }
    }

    /**
     * MSB 自动调度
     *
     * @param session
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/msb/autoSchedule")
    public String autoSchedule(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            //TODO invoke schedule algorithm
            sp.work();
            List<Ans> anslist = sp.ansList;
            for (Ans a : anslist) {
                String msbid = a.getMsbId();
                List<Scheduling> slist = sSvc.selectListByMSBIds(Lists.newArrayList(msbid));
                int rst_i = 0;
                for (int i = 0; i < slist.size(); i++) {
                    Scheduling s = slist.get(i);
                    //is locked
                    if (!StringUtils.isEmpty(s.getSsltid()) && !StringUtils.isEmpty(s.getLocked()) && s.getLocked().equals("1")) {
                        continue;
                    }
                    if (rst_i < a.size()) {
                        String sid = a.getSlotId(rst_i++);
                        s.setSsltid(sid);
                    } else {
                        s.setSsltid("");
                    }

                }
                for (Scheduling s : slist) {
                    sSvc.updateById(s);
                }
            }
            sp.ansClear();
            return writeJSONSuccResponse(response, null);
        } catch (Exception e) {
            logger.error(e.toString());
            return writeJSONErrorResponse(response, e.toString());
        }
    }

    /**
     * 载入MSB调整页面
     *
     * @param session
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/msb/adjust")
    public String msbAdjust(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<ScheduleSlot> sslot = sslotSvc.getAvailableSlotList();
        request.setAttribute("schedulesolt", sslot);
        JSONArray jarray = new JSONArray();
        for (ScheduleSlot s : sslot) {
            JSONObject o = new JSONObject();
            o.accumulate("slotid", s.getId());
            o.accumulate("begintime", DateUtils.getSimpleDate(s.getBegintime()));
            o.accumulate("endtime", DateUtils.getSimpleDate(s.getEndtime()));
            jarray.add(o);
        }
        request.setAttribute("scheduleSlotJson", jarray.toString());
        return "msbscheduling";
    }

    /**
     * 输出MSB调整页MSB搜索JSON
     *
     * @param session
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/msb/adjust/msbsearch")
    public String msbAdjustSearch(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        try {
            String str = request.getParameter("search");
            Pair<String, List<Object>> sql = advancedSearchSQLGen(str);
            List<MSB> list = msbSvc.selectList(Condition.create().where(sql.first, (Object[]) sql.second.toArray()));
            //construct json string
            JSONArray jarrout = new JSONArray();
            for (MSB m : list) {
                //Scheduled
                List<Scheduling> sslots = sSvc.selectListByMSBIds(Lists.newArrayList(m.getId()));
                for (Scheduling sslot : sslots) {
                    JSONObject o = new JSONObject();
                    o.accumulate("id", sslot.getId());
                    o.accumulate("msbid", sslot.getMsbid());
                    o.accumulate("msbid_rc", sslot.getMsbidRepeatcount());
                    o.accumulate("slotid", sslot.getSsltid());
                    o.accumulate("status", sslot.getStatus());
                    o.accumulate("observedcounts", sslot.getObservedcounts());
                    o.accumulate("observedtime", sslot.getObservedtime());
                    o.accumulate("repeatcounts", m.getRepeatcounts());
                    o.accumulate("estimatedtime", m.getEstimatedtime());
                    o.accumulate("propid", m.getPropid());
                    o.accumulate("note", m.getNote());
                    o.accumulate("locked", sslot.getLocked());
                    jarrout.add(o);
                }
            }
            return writeJSONSuccResponse(response, jarrout);
        } catch (Exception e) {
            logger.error(e.toString());
            return writeJSONErrorResponse(response, e.toString());
        }

    }

    @RequestMapping(value = "/msb/adjust/update")
    public String msbScheduleUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            String str = request.getParameter("result");
            JSONArray jarray = JSONArray.fromObject(str);
            for (int i = 0; i < jarray.size(); i++) {
                JSONObject o = (JSONObject) jarray.get(i);
                String id = o.getString("id");
                Scheduling s = sSvc.selectById(Integer.valueOf(id));
                s.setSsltid(o.getString("slotid"));
                s.setLocked(o.getString("locked"));
                sSvc.updateById(s);
            }
            return writeJSONSuccResponse(response, null);
        } catch (Exception e) {
            logger.error(e.toString());
            return writeJSONErrorResponse(response, e.toString());
        }
    }

    @RequestMapping(value = "/msb/manualExecute")
    public String manualExecute(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String result = "none.";
        try {
            String str = request.getParameter("schedulelist");
            List<String> msblist = Splitter.on(";").omitEmptyStrings().splitToList(str);
            if (!msblist.isEmpty()) {
                List<Scheduling> _slist = sSvc.selectListByMSBIds(msblist);
                result = sendInstructions(_slist);
            }
            return writeJSONSuccResponse(response, result);
        } catch (Exception e) {
            logger.error(e.getMessage());
            return writeJSONErrorResponse(response, e.toString());
        }
    }

    @RequestMapping(value = "/msb/autoExecute")
    public String autoExecute(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String result = "none.";
        try {
            List<Scheduling> _slist = sSvc.selectList(null);
            result = sendInstructions(_slist);
            return writeJSONSuccResponse(response, result);
        } catch (Exception e) {
            logger.error(e.getMessage());
            return writeJSONErrorResponse(response, e.toString());
        }
    }

    /**
     * 将调度结果发送至总控系统
     *
     * @param _slist
     * @return
     */
    private String sendInstructions(List<Scheduling> _slist) {
        //send orders to GC
        return NewObs.newObsFile(generateObsOrders(_slist), "instruction_" + DateUtils.getDateString("yyyyMMddhhmmss", new Date()) + ".txt");
    }

    private List<ObsOrder> generateObsOrders(List<Scheduling> _slist) {
        List<Scheduling> slist = new ArrayList<Scheduling>();
        HashMap<String, ScheduleSlot> slotmap = new HashMap<String, ScheduleSlot>();
        for (Scheduling s : _slist) {
            if (!slotmap.containsKey(s.getSsltid())) {
                ScheduleSlot slot = sslotSvc.selectById(s.getSsltid());
                if (slot != null) {
                    //only send scheduled msbs
                    slist.add(s);
                    slotmap.put(slot.getId(), slot);
                } else {
                    //un-scheduled
                }
            } else {
                //only send scheduled msbs
                slist.add(s);
            }
        }
        //按照时间排序
        slist.sort(new SchedulingComparator(slotmap));
        HashMap<String, List<Observation>> obsmap = new HashMap<String, List<Observation>>();
        List<ObsOrder> orders = new ArrayList<ObsOrder>();
        for (int i = 0; i < slist.size(); i++) {
            Scheduling s = slist.get(i);
            MSB m = msbSvc.selectById(s.getMsbid());
            ScheduleSlot slot = slotmap.get(s.getSsltid());
            List<Observation> obslist;
            if (!obsmap.containsKey(s.getMsbid())) {
                obsmap.put(s.getMsbid(), obslist = obsSvc.selectListByMSBId(s.getMsbid()));
            } else {
                obslist = obsmap.get(s.getMsbid());
            }
            for (Observation o : obslist) {
                //TODO generate ObsOrder object
                String id = m.getId() + "_" + o.getId();
                ObsOrder odr = new ObsOrder(id, o, slot, m);
                orders.add(odr);
            }
        }
        return orders;
    }

    /**
     * Comparator of Scheduling
     *
     * @author liec
     */
    class SchedulingComparator implements Comparator<Scheduling> {

        HashMap<String, ScheduleSlot> slotmap;

        /**
         * @param slotmap contained Scheduleslots
         */
        public SchedulingComparator(HashMap<String, ScheduleSlot> slotmap) {
            super();
            this.slotmap = slotmap;
        }

        @Override
        public int compare(Scheduling o1, Scheduling o2) {
            long o1_time = slotmap.get(o1.getSsltid()).getBegintime().getTime();
            long o2_time = slotmap.get(o2.getSsltid()).getBegintime().getTime();
            return (int) (o1_time - o2_time);
        }

    }
}
