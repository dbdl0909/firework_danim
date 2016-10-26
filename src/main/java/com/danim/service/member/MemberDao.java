package com.danim.service.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	private final String namesPace = "com.danim.service.MemberMapper";
	
	public void insertMember(MemberDto memberDto) {
		logger.info("insertMember() MemberDao.java");
	}
	
/*	public void insertMemberInfo(MemberDao memberDto) {
		logger.info("insertMemberInfo() MemberDao.java");
	}
	public void insertMemberTotal(MemberDao memberDto) {
		logger.info("insertMemberTotal() MemberDao.java");
		
		//return sessionTemplate.insert(namesPace+".insertMemberTotal", memberDto);
	}*/
	
}
