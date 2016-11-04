package com.danim.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DiaryController2 {
	@RequestMapping(value = "/diary2/calendar", method = RequestMethod.GET)
	public String calendar(){		
		return "/diary2/calendar";
	}
}
