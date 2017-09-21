package com.tju.fast.ocs.controller;

import com.tju.fast.ocs.po.Euser;
import com.tju.fast.ocs.service.IUserService;
import com.tju.fast.ocs.util.Page;
import com.tju.fast.ocs.util.StringUtils;
import com.tju.fast.ocs.util.TimestampMorpher;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController extends BaseController {

    private Logger logger = getLogger(UserController.class);

    @Autowired
    IUserService userSvc;

    @RequestMapping(value = "/login")
    public String loadPage_Login(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "login";
    }

    @RequestMapping(value = "/user/changepwdpage")
    public String loadPage_ChangePwd(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "changepwd";
    }

    @RequestMapping(value = "/user/usermanage")
    public String loadPage_UserManage(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "usermanage";
    }

    @RequestMapping(value = "/user/userlist")
    public String userList(@RequestParam int page, @RequestParam int rows, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Page<Euser> p = userSvc.queryPage(page, rows);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("total", p.getTotalCount());
        result.put("rows", getJSONArray(p.getResult()));
        return writeJSONResponse(response, result);
    }

    @RequestMapping(value = "/user/changessubmit")
    public String changesSubmit(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String data = request.getParameter("data");
        if (!StringUtils.isEmpty(data)) {
            JSONArray _jarray = JSONArray.fromObject(data);
            for (int i = 0; i < _jarray.size(); i++) {
                JSONObject json = _jarray.getJSONObject(i);
                JSONUtils.getMorpherRegistry().registerMorpher(new TimestampMorpher(new String[]{DATEFORMAT}));
                Euser u = (Euser) JSONObject.toBean(json, Euser.class);
                if (u.getUserid() == null) {
                    //add
                    userSvc.createUser(u);
                } else {
                    //updata
                    userSvc.updateById(u);
                }

            }
        }
        return writeJSONSuccResponse(response, "");
    }

    @RequestMapping(value = "/user/resetpassword")
    public String resetPassword(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String data = request.getParameter("userid");
        if (!StringUtils.isEmpty(data)) {
            Euser optuser = (Euser) request.getSession().getAttribute("currentUser");
            if (optuser.getRole().equals(IUserService.ROLE.ADMIN.str)) {
                Euser u = userSvc.selectById(new Integer(data));
                u.setPassword(userSvc.DEFAULTPASSWORD);
                u.setStatus(IUserService.STATUS.PWDCHANGE.str);
                userSvc.updateById(u);
                return writeJSONSuccResponse(response, "");
            }
        }
        return writeJSONErrorResponse(response, "");
    }

    @RequestMapping(value = "/user/login")
    public String login(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String username = request.getParameter("username");
        String pwd = request.getParameter("password");
        String time = (String) session.getAttribute("firstTime");
        String msg = "用户名密码格式不正确";
        if (!StringUtils.isEmpty(username) && !StringUtils.isEmpty(pwd)) {
            Euser u = userSvc.login(username, pwd);
            if (u != null) {
                session.setAttribute("currentUser", u);
                userSvc.setLastLoginTime(u);
                return "redirect:/index";
            }
            msg = "用户名或密码不正确";
        }
        if (StringUtils.isEmpty(time)) {
            msg = "";
            time = "" + new Date().getTime();
        }
        request.setAttribute("message", msg);
        session.setAttribute("firstTime", time);
        return "login";
    }

    @RequestMapping(value = "/user/loginout")
    public String loginout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        session.setAttribute("currentUser", null);
        return "login";
    }

    @RequestMapping(value = "/user/isAvailable")
    public String isAvailable(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String username = request.getParameter("username");
        if (StringUtils.isEmpty(username)) {
            return null;
        }
        return writeJSONSuccResponse(response, "" + userSvc.isAvailable(username));
    }

    @RequestMapping(value = "/user/isCorrect")
    public String isCorrect(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            String oldpass = request.getParameter("oldpwd");
            if (!StringUtils.isEmpty(oldpass)) {
                Euser user = (Euser) request.getSession().getAttribute("currentUser");
                if (user != null) {
                    Euser u = userSvc.login(user.getUsername(), oldpass);
                    if (u != null) {
                        return null;
                    }
                }
            }
            response.sendError(400, "Password Incorrect.");
            return null;
        } catch (Exception e) {
            logger.error(e.toString());
            response.sendError(400, "Internal Server Error.");
            return null;
        }
    }

    @RequestMapping(value = "/user/changepwd")
    public String changePwd(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            String oldpass = request.getParameter("oldpass");
            String newpass = request.getParameter("newpass");
            if (!StringUtils.isEmpty(oldpass)) {
                Euser user = (Euser) request.getSession().getAttribute("currentUser");
                if (user != null) {
                    Euser u = userSvc.login(user.getUsername(), oldpass);
                    if (u != null && !u.getStatus().equals(IUserService.STATUS.DISABLE.str)) {
                        u.setPassword(newpass);
                        u.setStatus(IUserService.STATUS.NORMAL.str);
                        userSvc.updateById(u);
                        session.setAttribute("currentUser", u);
                        return writeJSONSuccResponse(response, "true");
                    }
                }
            }
            return writeJSONSuccResponse(response, "false");
        } catch (Exception e) {
            logger.error(e.toString());
            return writeJSONErrorResponse(response, e.toString());
        }
    }
}
