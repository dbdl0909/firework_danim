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
	
	public int insertMemberTotal(MemberTotalInsertDto memberTotalInsertDto) {
		logger.info("insertMemberTotal() MemberDao.java");
		logger.info("memberTotalInsertDto :  {}", memberTotalInsertDto);
		return sessionTemplate.insert(namesPace + ".insertMemberTotal", memberTotalInsertDto);
	}
	
	public int insertMemberInfo(MemberInfoDto memberInfoDto) {
		logger.info("insertMemberInfo() MemberDao.java");
		return sessionTemplate.insert(namesPace + ".insertMemberInfo", memberInfoDto);
	}
	
}
