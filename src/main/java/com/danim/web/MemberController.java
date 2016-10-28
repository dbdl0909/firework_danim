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
	//회원리스트폼
	@RequestMapping(value="/member/memberListAll", method = RequestMethod.GET)
	public String memberListAll(Model model) {
		logger.info("memberListAll MemberController.java");
		
		model.addAttribute("selectMemberAll", memberService.selectMemberAll());
		
		return "member/memberListAll";
	}
	/*
	//회원리스트 실행
	@RequestMapping(value="/member/memberListAllView", method = RequestMethod.POST)
	public String selectMemberAll(Model model, MemberDto memberDto) {
		return "redirect:/member/memberListAll";
	}*/
	
	//입력 폼
	@RequestMapping(value = "/member/memberJoinForm", method = RequestMethod.GET)
	public String memberJoin(Model model) {
		return "member/memberJoinForm";
	}
	//입력폼 실행
	@RequestMapping(value = "/member/memberJoinSubmit", method = RequestMethod.POST)
	public String memberInsert(Model model, MemberDto memberDto) {
		logger.info("memberInsert MemberController.java");
		logger.info("MemberDto : {}", memberDto);
		
		memberService.insertMember(memberDto);
		
		return "redirect:/";
	}
}
