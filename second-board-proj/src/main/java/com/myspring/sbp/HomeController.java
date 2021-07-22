package com.myspring.sbp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = { "/", "/home.do" }, method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response, Model model) {
		String result = request.getParameter("result");
		if (result == null) {
			return "home";
		} else if (result.equals("logouted")) {
			model.addAttribute("result", "logouted");
		} else if (result.equals("added")) {
			model.addAttribute("result", "added");
		}
		return "home";
	}

}