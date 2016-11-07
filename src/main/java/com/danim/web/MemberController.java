package com.danim.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.danim.service.member.MemberDto;
import com.danim.service.member.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	//로그아웃
	@RequestMapping(value="/member/memberLogout", method = RequestMethod.GET)
	public String MemberLogout(HttpSession session) {
		String logoutTime = new SimpleDateFormat("yyyy/mm/dd/hh:mm").format(new Date());
		logger.info("logoutTime : {}", logoutTime);
		session.invalidate();	//세션 종료(데이터 전부 삭제)
		return "redirect:/";
	}
	//로그인
	@RequestMapping(value="/member/memberLoginSubmit", method = RequestMethod.POST)
	public String MemberLogin(HttpServletRequest request,
			@RequestParam(value="memberLoginId") String memberId,
			@RequestParam(value="memberLoginPassword") String memberInfoPassword) {
		logger.info("memberId : {} MemberController.java", memberId);
		logger.info("memberInfoPassword : {} MemberController.java", memberInfoPassword);

		int memberCheckIndex = memberService.selectMemberCheck(memberId, memberInfoPassword);
		
		if(memberCheckIndex == 1) {
			HttpSession session  = request.getSession(true);
			session.setAttribute("memberId", memberId);
		}
		return "redirect:/";
	}
	//로그인폼
	@RequestMapping(value="/member/memberLoginForm", method = RequestMethod.GET)
	public String memberLogin(Model model) {
		logger.info("memberLogin MemberController.java");
		return "/member/memberLoginForm";
	}
	//회원리스트
	@RequestMapping(value="/member/memberListAll", method = RequestMethod.POST)
	public String memberListAll(Model model) {
		logger.info("memberListAll MemberController.java");
		model.addAttribute("selectMemberAll", memberService.selectMemberAll());
		return "member/memberListAll";
	}
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
