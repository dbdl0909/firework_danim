package com.danim.service.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	
	private SqlSessionTemplate sessionTemplate;

	@Autowired
	private final String NS = "com.danim.service.MemberMapper";

}
