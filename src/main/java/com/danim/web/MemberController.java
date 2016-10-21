package com.danim.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@RequestMapping(value = "/member/memberInsertForm")
	public String mainPlan() {
		logger.info("Welcome mainPlan! The client locale is {}.");
		return "member/memberInsertForm";
	}
}
