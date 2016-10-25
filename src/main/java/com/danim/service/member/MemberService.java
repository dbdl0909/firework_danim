package com.danim.service.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberService {
	private final String NS = "com.danim.service";
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	public void insertMemberTotal(MemberDao memberDto) {
		sessionTemplate.insert(NS+"insertMember",memberDto);
		logger.info("insertMember() MemberService.java");
	}

}
