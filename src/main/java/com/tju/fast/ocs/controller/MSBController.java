package com.tju.fast.ocs.controller;

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
        request.setAttribute("proplist", propSvc.getList());
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
            List<MSB> list = msbSvc.getList(null, sql.first, sql.second.toArray());
            //construct json string
            JSONArray jarrout = new JSONArray();
            for (MSB m : list) {
                //Scheduled
                List<Scheduling> schlist = sSvc.getList(m.getId());
                for (int i = 0; i < schlist.size(); i++) {
                    Scheduling sching = schlist.get(i);
                    String slotid = sching.getSsltid();
                    Scheduleslot slot = sslotSvc.get(slotid);
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
                    o.accumulate("msbid_rc", sching.getMsbid_repeatcount());
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
                MSB msb = msbSvc.get(str);
                List<Observation> obslist = obsSvc.getList(null, "where msbid = ?", msb.getId());
                JSONObject json = JSONObject.fromObject(msb);
                JSONArray jarr = JSONArray.fromObject(obslist);
                json.accumulate("observations", jarr);
                List<Scheduling> slist = sSvc.getList(msb.getId());
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
                List<Scheduling> _slist = sSvc.getList(null, "where msbid=?", msb.getId());
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
                List<Scheduling> slist = sSvc.getList(msbid);
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
                    sSvc.update(s);
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
        List<Scheduleslot> sslot = sslotSvc.getAvailableSlotList();
        request.setAttribute("schedulesolt", sslot);
        JSONArray jarray = new JSONArray();
        for (Scheduleslot s : sslot) {
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
            List<MSB> list = msbSvc.getList(null, sql.first, sql.second.toArray());
            //construct json string
            JSONArray jarrout = new JSONArray();
            for (MSB m : list) {
                //Scheduled
                List<Scheduling> sslots = sSvc.getList(m.getId());
                for (Scheduling sslot : sslots) {
                    JSONObject o = new JSONObject();
                    o.accumulate("id", sslot.getId());
                    o.accumulate("msbid", sslot.getMsbid());
                    o.accumulate("msbid_rc", sslot.getMsbid_repeatcount());
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
                Scheduling s = sSvc.get(Integer.valueOf(id));
                s.setSsltid(o.getString("slotid"));
                s.setLocked(o.getString("locked"));
                sSvc.update(s);
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
            String[] msbids = str.split(";");
            if (msbids.length > 0) {
                StringBuffer sql = new StringBuffer();
                sql.append("where ");
                for (int i = 0; i < msbids.length; i++) {
                    sql.append("msbid=? ");
                    if (i < msbids.length - 1) {
                        sql.append("or ");
                    }
                }
                List<Scheduling> _slist = sSvc.getList(null, sql.toString(), (Object[]) msbids);
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
            List<Scheduling> _slist = sSvc.getList();
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
        HashMap<String, Scheduleslot> slotmap = new HashMap<String, Scheduleslot>();
        for (Scheduling s : _slist) {
            if (!slotmap.containsKey(s.getSsltid())) {
                Scheduleslot slot = sslotSvc.get(s.getSsltid());
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
            MSB m = msbSvc.get(s.getMsbid());
            Scheduleslot slot = slotmap.get(s.getSsltid());
            List<Observation> obslist;
            if (!obsmap.containsKey(s.getMsbid())) {
                obsmap.put(s.getMsbid(), obslist = obsSvc.getList(null, "where msbid=?", s.getMsbid()));
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

        HashMap<String, Scheduleslot> slotmap;

        /**
         * @param slotmap contained Scheduleslots
         */
        public SchedulingComparator(HashMap<String, Scheduleslot> slotmap) {
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
