package com.danim.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

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
import com.danim.service.member.MemberTotalDto;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;

	//회원정보수정폼
	@RequestMapping(value="/member/memberUpdateForm", method = RequestMethod.GET)
	public String memberUpdate(Model model, @RequestParam(value="memberLoginId") String memberId) {
		logger.info("memberUpdate MemberController.java");
		logger.info("memberId : {} MemberController.java", memberId);
		return "/member/memberUpdate";	
	}
	//회원정보폼 실행
	@RequestMapping(value = "/member/memberUpdateSubmit", method = RequestMethod.POST)
	public String memberUpdate(Model model, MemberDto memberDto) {
		logger.info("memberUpdate MemberController.java");
		logger.info("MemberDto : {}", memberDto);
		memberService.memberUpdate(memberDto);
		return"/member/memberInfo";
	}
	//회원정보보기
	@RequestMapping(value="/member/memberInfo", method = RequestMethod.GET)
	public String memberInfo(Model model, @RequestParam(value="memberLoginId") String memberId) {
		logger.info("memberInfo MemberController.java");
		logger.info("memberId : {} MemberController.java", memberId);
		model.addAttribute("memberInfo", memberService.memberinfo(memberId));
		return "/member/memberInfo";
	}	
	//로그아웃
	@RequestMapping(value="/member/memberLogout", method = RequestMethod.GET)
	public String memberLogout(HttpSession session) {
		String logoutTime = new SimpleDateFormat("yyyy/mm/dd/hh:mm").format(new Date());
		logger.info("logoutTime : {}", logoutTime);
		session.invalidate();	//세션 종료(데이터 전부 삭제)
		return "redirect:/";
	}
	//로그인
	@RequestMapping(value="/member/memberLoginSubmit", method = RequestMethod.POST)
	public String memberLogin(HttpServletRequest request,
			@RequestParam(value="memberLoginId") String memberId,
			@RequestParam(value="memberLoginPassword") String memberInfoPassword) {
		logger.info("memberId : {} MemberController.java", memberId);
		logger.info("memberInfoPassword : {} MemberController.java", memberInfoPassword);

		Map<String, String> memberLoginInfo = memberService.selectMemberCheck(memberId, memberInfoPassword);
		logger.info("memberLoginInfo : {}", memberLoginInfo);
		
		if(memberLoginInfo != null) {
			HttpSession session  = request.getSession(true);
			session.setAttribute("memberId", memberId);
			session.setAttribute("memberLevel", memberLoginInfo.get("memberLevel"));
			session.setAttribute("memberName", memberLoginInfo.get("memberName"));
			logger.info("memberLevel : {}", memberLoginInfo.get("memberLevel"));
			logger.info("memberName : {}", memberLoginInfo.get("memberName"));
		}
		return "redirect:/";
	}
	
	//연동로그인
	@RequestMapping(value="/member/memberLinkLoginSubmit", method = RequestMethod.POST)
	public String memberLinkLogin(HttpServletRequest request,
			@RequestParam(value="memberId") String memberId,
			@RequestParam(value="memberName") String memberName,
			@RequestParam(value="facebookCheck") String facebookCheck,
			Model model) {
		logger.info("memberId : {} memberLinkLogin MemberController.java", memberId);
		logger.info("memberName : {} memberLinkLogin MemberController.java", memberName);
		logger.info("facebookCheck : {} memberLinkLogin MemberController.java", facebookCheck);
		
		MemberTotalDto memberTotalDto = memberService.memberLinkCheck(memberId, memberName);
		logger.info("memberLoginTotal : {}", memberTotalDto);
		if(memberTotalDto != null) {
			HttpSession session  = request.getSession(true);
			session.setAttribute("memberId", memberTotalDto.getMemberId());
			session.setAttribute("memberLevel", memberTotalDto.getMemberLevel());
			session.setAttribute("memberName", memberTotalDto.getMemberName());
			session.setAttribute("facebookCheck", facebookCheck);
			logger.info("memberLevel : {}", memberTotalDto.getMemberLevel());
			logger.info("memberName : {}", memberTotalDto.getMemberName());
		}
				
		return "redirect:/";
	}
	//외부회원 입력(연동)
	@RequestMapping(value = "/member/memberLinkSubmit", method = RequestMethod.POST)
	public String memberLinkInsert(Model model, MemberTotalDto memberTotalDto) {
		logger.info("memberLinkInsert MemberController.java");
		logger.info("memberTotalDto : {}", memberTotalDto);
		memberService.inserLinkMember(memberTotalDto);
		return "redirect:/";
	}	
	//로그인폼
	@RequestMapping(value="/member/memberLoginForm", method = RequestMethod.GET)
	public String memberLogin(Model model) {
		logger.info("memberLogin MemberController.java");
		return "/member/memberLoginForm";
	}
	//회원리스트
	@RequestMapping(value="/member/memberListAll", method = RequestMethod.GET)
	public String memberListAll(Model model,
			@RequestParam(value="memberIdCheck", defaultValue = "") String memberIdCheck,
			@RequestParam(value="memberStatus", defaultValue = "") String memberStatus,
			@RequestParam(value="page", defaultValue="1") int page) {		//페이징
		logger.info("memberListAll MemberController.java");
		logger.info("memberListAll MemberController memberIdCheck : {} ", memberIdCheck);
		logger.info("memberListAll MemberController memberStatus : {} ", memberStatus);
	
		if(memberIdCheck.equals("")) {		//연동여부 선택되지 않았을 때(전체회원)
			if(memberStatus.equals("")) {	//회원상태가 선택되지 않았을 때(전체회원)
				model.addAttribute("selectMemberAll", memberService.selectMemberAll(page));
			} else if(memberStatus.equals("normalMember")) {		//회원상태가 정상일 때
				model.addAttribute("selectMemberAll", memberService.selectMemberNormal(page));
			} else if(memberStatus.equals("stopMember")) {			//회원상태가 정지일 때
				model.addAttribute("selectMemberAll", memberService.selectMemberStop(page));
			} else if(memberStatus.equals("leaveMember")) {			//회원상태가 탈퇴일 떄
				model.addAttribute("selectMemberAll", memberService.selectMemberLeave(page));
			}
		} else if(memberStatus.equals("")) {
			if(memberIdCheck.equals("T")) {		//연동여부가 내부회원(T)일 때
				model.addAttribute("selectMemberAll", memberService.selectMemberT(page));
			} else if(memberIdCheck.equals("F")) {		//연동여부가 외부회원(F)일 때
				model.addAttribute("selectMemberAll", memberService.selectMemberF(page));
			}
		}
		//페이징
		int startPage = memberService.getStartPage(page);
		int endPage = memberService.getEndPage(startPage);
		int lastPage = memberService.getLastPage(memberIdCheck, page);
		if(lastPage < endPage){
			endPage = lastPage;
		}
		logger.info("startPage{} MemberController.java", startPage);
		logger.info("endPage{} MemberController.java", endPage);	
		logger.info("totalPage{} MemberController.java", lastPage);
		model.addAttribute("startPage", startPage);
        model.addAttribute("page", page);
        model.addAttribute("endPage", endPage);
        model.addAttribute("lastPage", lastPage);
        model.addAttribute("totalCount", memberService.countMemberList(memberIdCheck));
		return "/member/memberListAll";
	}
	//입력 폼
	@RequestMapping(value = "/member/memberJoinForm", method = RequestMethod.GET)
	public String memberJoin(Model model) {
		return "member/memberJoinForm";
	}
	//내부회원 입력폼 실행
	@RequestMapping(value = "/member/memberJoinSubmit", method = RequestMethod.POST)
	public String memberInsert(Model model, MemberDto memberDto) {
		logger.info("memberInsert MemberController.java");
		logger.info("MemberDto : {}", memberDto);
		memberService.insertMember(memberDto);
		return "redirect:/";
	}
}
