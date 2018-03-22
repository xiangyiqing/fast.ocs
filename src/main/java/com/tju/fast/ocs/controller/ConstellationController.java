package com.tju.fast.ocs.controller;

import com.baomidou.mybatisplus.mapper.Condition;
import com.google.common.collect.Lists;
import com.tju.fast.ocs.po.MSB;
import com.tju.fast.ocs.po.Observation;
import com.tju.fast.ocs.po.Scheduling;
import com.tju.fast.ocs.util.Pair;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ConstellationController extends BaseController {

    private Logger logger = getLogger(ConstellationController.class);

    @RequestMapping(value = "/constellation")
    public String constellation(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setAttribute("proplist", propSvc.selectList(null));
//        return "constellation_wwt";
        return "constellation_hips";
    }

    @RequestMapping(value = "/constellation/data")
    public String loadData(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            String str = request.getParameter("search");
            Pair<String, List<Object>> sql = advancedSearchSQLGen(str);
            List<MSB> list = msbSvc.selectList(Condition.create().where(sql.first, sql.second.toArray()));
            //construct json string
            JSONArray jarrout = new JSONArray();
            for (MSB m : list) {
                List<Observation> obslist = obsSvc.selectListByMSBId(m.getId());
                for (Observation obs : obslist) {
                    JSONObject json = new JSONObject();
                    json.accumulate("msbid", m.getId());
                    json.accumulate("obsid", obs.getId());
                    json.accumulate("ra", obs.getRa2000());
                    json.accumulate("dec", obs.getDec2000());
                    List<Scheduling> slist = sSvc.selectListByMSBIds(Lists.newArrayList(m.getId()));
                    json.accumulate("status", msbSvc.getMSBStatus(slist));
                    json.accumulate("title", obs.getTitle());
                    jarrout.add(json);
                }
            }
            return writeJSONSuccResponse(response, jarrout);
        } catch (Exception e) {
            logger.error(e.toString());
            return writeJSONErrorResponse(response, e.toString());
        }
    }
}
