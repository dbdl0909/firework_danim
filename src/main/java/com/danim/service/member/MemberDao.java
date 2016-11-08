package com.danim.service.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	private final String nameSpace = "com.danim.service.MemberMapper";
	//회원정보보기
	public MemberSelectInfoDto memberInfo(String memberId) {
		logger.info("memberinfo() MemberSelectInfoDto.java");
		logger.info("memberId : {}", memberId);
		return sessionTemplate.selectOne(nameSpace+".memberSelectInfo", memberId);
	}
	//회원정보 수정
	public void memberUpdate(MemberDto memberDto){
		logger.info("memberUpdate() MemberDao.java");
		sessionTemplate.update(nameSpace+".memberUpdate", memberDto);		
	}	
	//로그인 체크
	public Map<String, String>memberCheck(String memberId, String memberInfoPassword) {
		logger.info("memberCheck() MemberDao.java");
		logger.info("memberId : {}", memberId);
		logger.info("memberInfoPassword : {}", memberInfoPassword);
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("memberInfoPassword", memberInfoPassword);
		return sessionTemplate.selectOne(nameSpace+".memberCheck", map);
	}
	
	//모든 회원 리스트 출력
	public List<MemberDto> selectMemberAll() {
		logger.info("selectMemberAll() MemberDao.java");
		return sessionTemplate.selectList(nameSpace+".selectMemberAll");
	}
	//회원 total 입력
	public int insertMemberTotal(MemberTotalInsertDto memberTotalInsertDto) {
		logger.info("insertMemberTotal() MemberDao.java");
		logger.info("memberTotalInsertDto :  {}", memberTotalInsertDto);
		return sessionTemplate.insert(nameSpace + ".insertMemberTotal", memberTotalInsertDto);
	}
	//회원 info 입력
	public int insertMemberInfo(MemberInfoDto memberInfoDto) {
		logger.info("insertMemberInfo() MemberDao.java");
		return sessionTemplate.insert(nameSpace + ".insertMemberInfo", memberInfoDto);
	}
	
}
