package com.tju.fast.ocs.controller;

import com.tju.fast.ocs.po.Fastproposal;
import com.tju.fast.ocs.po.MSB;
import com.tju.fast.ocs.service.*;
import com.tju.fast.ocs.util.DateJsonValueProcessor;
import com.tju.fast.ocs.util.Pair;
import com.tju.fast.ocs.util.StringUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public abstract class BaseController {

    public final static String DATEFORMAT = "yyyy-MM-dd HH:mm:ss";

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

    protected Logger getLogger(Class<?> arg) {
        return LoggerFactory.getLogger(arg);
    }

    protected String writeResponse(HttpServletResponse response, String str) {
        try {
            response.setContentType("text/json; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println(str);
            out.flush();
            out.close();
        } catch (Exception e) {
            getLogger(this.getClass()).error(e.toString());
        }
        return null;
    }

    protected String writeJSONResponse(HttpServletResponse response, Object obj) {
        if (obj instanceof List) {
            return writeResponse(response, JSONArray.fromObject(obj).toString());
        }
        return writeResponse(response, JSONObject.fromObject(obj).toString());
    }

    protected String writeJSONSuccResponse(HttpServletResponse response, Object tojson) {
        String str = "{}";
        if (tojson instanceof List) {
            str = getJSONArray((List) tojson).toString();
        } else {
            str = getJSONObject(tojson).toString();
        }
        return writeJSONSuccResponse(response, str);
    }

    protected String writeJSONSuccResponse(HttpServletResponse response, String msg) {
        JSONObject o = new JSONObject();
        o.accumulate("status", "success");
        o.accumulate("content", msg);
        return writeResponse(response, o.toString());
    }

    protected String writeJSONErrorResponse(HttpServletResponse response, String error) {
        JSONObject o = new JSONObject();
        o.accumulate("status", "error");
        o.accumulate("error", error);
        return writeResponse(response, o.toString());
    }

    protected Pair<String, List<Object>> advancedSearchSQLGen(String search) {
        StringBuffer sql = new StringBuffer();
        List<Object> values = new ArrayList<Object>();

        if (!StringUtils.isEmpty(search)) {
            sql.append("where ");
            JSONArray jarr = JSONArray.fromObject(search);
            for (int i = 0; i < jarr.size(); i++) {
                JSONObject jobj = JSONObject.fromObject(jarr.get(i));
                String type = jobj.getString("type");
                String field = convertor(type);
                String value = jobj.getString("cond");
                String opt = convertor(jobj.getString("opt"));
                if (type.substring(0, 1).equals("p")) {
                    if (type.equals("pid")) {
                        sql.append("propid " + opt + " ? ");
                        values.add(convertValue(Fastproposal.class, "id", value));
                    } else {
                        if (opt.contains("like")) {
                            value = "%" + value + "%";
                        }
                        List<Fastproposal> plist = propSvc.getList("", "where " + field + " " + opt + " ? ", value);
                        for (int j = 0; j < plist.size(); j++) {
                            sql.append("propid = ? ");
                            values.add(convertValue(Fastproposal.class, "id", plist.get(j).getId()));
                            if (j < plist.size() - 1) {
                                sql.append("or ");
                            }
                        }
                    }
                } else if (type.substring(0, 1).equals("m")) {
                    sql.append(field + opt + "? ");
                    values.add(convertValue(MSB.class, field, value));
                }
                if (i < jarr.size() - 1) {
                    sql.append(jobj.getString("andor") + " ");
                }
            }
        }
        return new Pair<String, List<Object>>(sql.toString(), values);
    }

    /**
     * 给定po类中字段的String格式的值，根据po类中该字段的类型生成其对应类型的对象（根据String格式的值）。<br/>
     * 例如po类中某字段是Integer类型，给定String类型的值（如“4”），新建一个Integer类型的对象（值为4）
     *
     * @param po
     * @param fieldstr
     * @param arg
     * @return
     */
    protected Object convertValue(Class po, String fieldstr, String arg) {
        try {
            Field fields[] = po.getDeclaredFields();//获得对象所有属性
            Field field = null;
            Class ftype = null;
            for (int i = 0; i < fields.length; i++) {
                field = fields[i];
                field.setAccessible(true);//修改访问权限
                if (field.getName().equals(fieldstr)) {
                    ftype = field.getType();
                    break;
                }
            }
            Constructor[] ctor = ftype.getDeclaredConstructors();
            //找到我们需要的构造方法
            for (int i = 0; i < ctor.length; i++) {
                Class[] cl = ctor[i].getParameterTypes();
                if (cl.length == 1) {
                    //实例化对象
                    if (cl[0].getName().equals("java.lang.String")) {
                        return ftype.getConstructor(cl).newInstance(new Object[]{arg});
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arg;
    }

    protected String convertor(String arg) {
        switch (arg) {
            case "pid":
            case "mid":
                return "id";
            case "ptit":
            case "mtit":
                return "title";
            case "ppor":
                return "proposer";
            case "prate":
                return "rate";
            case "mrc":
                return "repeatcounts";
            case "mws":
                return "windspeed";
            case "mhd":
                return "humidity";
            case "mdn":
                return "day_or_night";
            case "mat":
                return "airtemp";
            case "mop":
                return "opacity";
            case "met":
                return "estimatedtime";
            case "oeq":
                return "=";
            case "olt":
                return "<";
            case "olq":
                return "<=";
            case "ogt":
                return ">";
            case "ogq":
                return ">=";
            case "onot":
                return "!=";
            case "olk":
                return "like";
            case "onlk":
                return "not like";
            case "and":
                return "and";
            case "or":
                return "or";
        }
        return null;
    }

    public static JSONObject getJSONObject(Object o) {
        JsonConfig config = new JsonConfig();
        config.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
        JSONObject json = JSONObject.fromObject(o, config);
        return json;
    }

    public static JSONArray getJSONArray(List<?> o) {
        JsonConfig config = new JsonConfig();
        config.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
        JSONArray json = JSONArray.fromObject(o, config);
        return json;
    }

}
