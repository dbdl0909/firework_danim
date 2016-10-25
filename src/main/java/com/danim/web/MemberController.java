package com.danim.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.danim.service.member.MemberDto;
import com.danim.service.member.MemberInfoDto;
import com.danim.service.member.MemberService;
import com.danim.service.member.MemberTotalDto;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/member/memberJoinForm", method = RequestMethod.GET)
	public String memberJoin(Model model) {
		return "member/memberJoinForm";
	}
	
	@RequestMapping(value = "/member/memberJoinSubmit", method = RequestMethod.POST)
	public String mainPlan(Model model, MemberDto memberDto) {
		logger.info("mainPlan MemberController.java");
		logger.info("MemberDto : {}", memberDto);
		
		memberService.insertMember(memberDto);
		
		return "redirect:/member/memberJoinForm";
	}
}
