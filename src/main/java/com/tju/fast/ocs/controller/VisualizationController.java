package com.tju.fast.ocs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class VisualizationController extends BaseController {

    @RequestMapping(value = "/visualize")
    public String visualize(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "visualize";
    }
}
