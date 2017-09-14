package com.tju.fast.ocs.controller;

import com.tju.fast.ocs.po.Scheduleslot;
import com.tju.fast.ocs.service.IBaseService;
import com.tju.fast.ocs.util.DateUtils;
import com.tju.fast.ocs.util.Page;
import com.tju.fast.ocs.util.StringUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class SysStatusController extends BaseController {


    /**
     * 载入系统信息页面
     *
     * @param session
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sysstatus")
    public String sysstatus(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "sysstatus";
    }

    /**
     * 载入时间块管理页面
     *
     * @param session
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sysstatus/timeslotmanage")
    public String loadPage_timeslotmanage(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "timeslotmanage";
    }

    @RequestMapping(value = "/sysstatus/timeslotlist")
    public String timeslotList(@RequestParam int page, @RequestParam int rows, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Page<Scheduleslot> p = sslotSvc.querySlotList(page, rows);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("total", p.getTotalCount());
        result.put("rows", getJSONArray(p.getResult()));
        return writeJSONResponse(response, result);
    }

    @RequestMapping(value = "/sysstatus/addtimeslot")
    public String addTimeSlot(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String data = request.getParameter("newslots");
        if (!StringUtils.isEmpty(data)) {
            JSONArray jarray = JSONArray.fromObject(data);
            for (int i = 0; i < jarray.size(); i++) {
                JSONObject json = jarray.getJSONObject(i);
                Scheduleslot s = new Scheduleslot();
                s.setId("s" + System.currentTimeMillis());
                s.setBegintime(DateUtils.getTimestamp(json.getString("begintime")));
                s.setEndtime(DateUtils.getTimestamp(json.getString("endtime")));
                s.setStatus(IBaseService.STATUS.DISABLE.str);
                sslotSvc.insert(s);
            }
        }
        return writeJSONSuccResponse(response, "");
    }
}
