package com.danim.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemeberInterceptor extends HandlerInterceptorAdapter {

	public boolean perHandel(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession(false);
		if(session == null) {	//세션이 존재하지 않거나
			response.sendRedirect(request.getContextPath()+"/member/memberLogin.jsp");
			return false;
		}
		MemberDto memberDto = (MemberDto)session.getAttribute("memberDto");
		if(memberDto == null) {	//사용자 정보가 없으면 다시 로그인 화면으로 이동
			response.sendRedirect(request.getContextPath()+"/member/memberLogin.jsp");
			return false;
		}
	return true;
	}
}
