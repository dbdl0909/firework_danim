package com.danim.service.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	MemberDao memberDao;
	
	//내부회원 가입 메서드
	public void insertMember(MemberDto memberDto) {
		memberDao.insertMember(memberDto);
	}
}