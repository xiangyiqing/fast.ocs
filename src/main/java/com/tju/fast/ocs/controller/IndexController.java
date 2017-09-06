package com.tju.fast.ocs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController extends BaseController {

    @RequestMapping(value = "/index")
    public String index(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "index";
    }
}
