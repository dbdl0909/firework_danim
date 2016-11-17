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
	public Map<String, String> memberCheck(String memberId, String memberInfoPassword) {
		logger.info("memberCheck() MemberDao.java");
		logger.info("memberId : {}", memberId);
		logger.info("memberInfoPassword : {}", memberInfoPassword);
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("memberInfoPassword", memberInfoPassword);
		return sessionTemplate.selectOne(nameSpace+".memberCheck", map);
	}
	//연동로그인 체크
	public int memberLinkCheck(String memberId, String memberName) {
		logger.info("memberLinkCheck() MemberDao.java");
		logger.info("memberId : {}", memberId);
		logger.info("memberName : {}", memberName);
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("memberName", memberName);
		return sessionTemplate.selectOne(nameSpace+".memberLinkCheck", map);
	}
	//첫 연동회원 DB저장
	public int memberLinkJoin(String memberId, String memberName) {
		logger.info("memberLinkJoin() MemberDao.java");
		logger.info("memberId : {}", memberId);
		logger.info("memberName : {}", memberName);
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("memberName", memberName);
		return sessionTemplate.insert(nameSpace+".memberLinkJoin", map);
	}
	//연동회원 로그인
	public MemberTotalDto memberSelectLink(String memberId, String memberName) {
		logger.info("memberSelectLink() MemberDao.java");
		logger.info("memberId : {}", memberId);
		logger.info("memberName : {}", memberName);
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("memberName", memberName);
		return sessionTemplate.selectOne(nameSpace+".memberSelectLink", map);
	}
	//모든 회원 리스트 출력
	public List<MemberDto> selectMemberAll(Map<String, Object> map) {
		logger.info("selectMemberAll() MemberDao.java");
		return sessionTemplate.selectList(nameSpace+".selectMemberAll", map);
	}
	//내부회원 리스트 출력
	public List<MemberDto> selectMemberT(Map<String, Object> map) {
		logger.info("selectMemberT() MemberDao.java");
		return sessionTemplate.selectList(nameSpace+".selectMemberT", map);
	}
	//외부회원 리스트 출력
	public List<MemberDto> selectMemberF(Map<String, Object> map) {
		logger.info("selectMemberF() MemberDao.java");
		return sessionTemplate.selectList(nameSpace+".selectMemberF", map);
	}
	//회원상태가 정상인 회원 리스트 출력
	public List<MemberDto> selectMemberNormal(Map<String, Object> map) {
		logger.info("selectMemberNormal() MemberDao.java");
		return sessionTemplate.selectList(nameSpace+".selectMemberNormal", map);
	}
	//회원상태가 정지인 회원 리스트 출력
	public List<MemberDto> selectMemberStop(Map<String, Object> map) {
		logger.info("selectMemberStop() MemberDao.java");
		return sessionTemplate.selectList(nameSpace+".selectMemberStop", map);
	}
	//회원상태가 탈퇴인 회원 리스트 출력
	public List<MemberDto> selectMemberLeave(Map<String, Object> map) {
		logger.info("selectMemberLeave() MemberDao.java");
		return sessionTemplate.selectList(nameSpace+".selectMemberLeave", map);
	}
	//페이징
	public int countMemberList(Map<String, Object> map){		
		return sessionTemplate.selectOne(nameSpace+".countMemberList", map);
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
