package com.danim.service.member;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	MemberDao memberDao;
	//total에는 기본값이 있어서 들어가지 않으므로 memberTotalInsertDto를 추가 생성 후 입력처리
	@Autowired
	MemberTotalInsertDto memberTotalInsertDto;
	@Autowired
	MemberInfoDto memberInfoDto;
	
	//회원정보조회
	public MemberSelectInfoDto memberinfo(String memberId) {
		logger.info("MemberService.java, memberinfo : {}", memberId);
		MemberSelectInfoDto memberSelectInfoDto = memberDao.memberInfo(memberId);
		logger.info("memberSelectInfoDto : {}", memberSelectInfoDto);
		return memberSelectInfoDto;
	}
	//회원정보 수정처리
	public void memberUpdate(MemberDto memberDto) {
		logger.info("MemberService.java, memberId : {}", memberDto.getMemberId());
		logger.info("MemberService.java, memberInfoPassword : {}", memberDto.getMemberInfoPassword());
		logger.info("MemberService.java, memberName : {}", memberDto.getMemberName());
		logger.info("MemberService.java, memberInfoBirth : {}", memberDto.getMemberInfoBirth());
		logger.info("MemberService.java, memberInfoGender : {}", memberDto.getMemberInfoGender());
		logger.info("MemberService.java, memberInfoEmail : {}", memberDto.getMemberInfoEmail());
		memberDao.memberUpdate(memberDto);
	}
	//로그인 아이디 체크
	public Map<String, String> selectMemberCheck(String memberId, String memberInfoPassword) {
		logger.info("selectMemberCheck() MemberService.java");
		Map<String, String> resultMap = memberDao.memberCheck(memberId, memberInfoPassword);
		if(resultMap == null) {
			logger.info("일치하는 아이디 없음");
		} else {
			logger.info("일치하는 아이디 있음");
		}
		return resultMap;
	}
	//연동로그인 아이디 체크
	public MemberTotalDto memberLinkCheck(String memberId, String memberName) {
		logger.info("memberLinkCheck() MemberService.java");
		MemberTotalDto memberTotalDto = null;
		int result = memberDao.memberLinkCheck(memberId, memberName);
		if(result == 0) {
			logger.info("일치하는 아이디 없음");
			memberDao.memberLinkJoin(memberId, memberName);			
			logger.info("등록을 한 뒤 회원의 정보 가져옴");
			memberTotalDto = memberDao.memberSelectLink(memberId, memberName);
		} else {
			logger.info("일치하는 아이디 있음");
			memberTotalDto = memberDao.memberSelectLink(memberId, memberName);
		}
		
		return memberTotalDto;
	}
	//회원리스트 출력
	public List<MemberDto> selectMemberAll() {
		logger.info("selectMemberAll() MemberService.java");
		
		//Map<String, Object> map = new HashMap<String, Object>();
		List<MemberDto> MemberListAll =  memberDao.selectMemberAll();
		for(int i=0; i<MemberListAll.size(); i++) {
			logger.info("MemberListAll : {}", MemberListAll.get(i));
		}
		return MemberListAll;
	}
	//내부회원리스트 출력
	public List<MemberDto> selectMemberT() {
		logger.info("selectMemberT() MemberService.java");
		
		List<MemberDto> selectMemberTrue =  memberDao.selectMemberT();
		for(int i=0; i<selectMemberTrue.size(); i++) {
			logger.info("selectMemberTrue : {}", selectMemberTrue.get(i));
		}
		return selectMemberTrue;
	}
	//외부회원리스트 출력
	public List<MemberDto> selectMemberF() {
		logger.info("selectMemberF() MemberService.java");
		
		List<MemberDto> selectMemberFalse =  memberDao.selectMemberF();
		for(int i=0; i<selectMemberFalse.size(); i++) {
			logger.info("selectMemberFalse : {}", selectMemberFalse.get(i));
		}
		return selectMemberFalse;
	}
	//회원상태가 정상인 회원리스트 출력
	public List<MemberDto> selectMemberNormal() {
		logger.info("selectMemberNormal() MemberService.java");
		
		List<MemberDto> selectNormalMember =  memberDao.selectMemberNormal();
		for(int i=0; i<selectNormalMember.size(); i++) {
			logger.info("selectMemberNormal : {}", selectNormalMember.get(i));
		}		
		return selectNormalMember;
	}
	//회원상태가 정지인 회원리스트 출력
	public List<MemberDto> selectMemberStop() {
		logger.info("selectMemberStop() MemberService.java");
		
		List<MemberDto> selectStopMember =  memberDao.selectMemberStop();
		for(int i=0; i<selectStopMember.size(); i++) {
			logger.info("selectMemberStop : {}", selectStopMember.get(i));
		}		
		return selectStopMember;
	}
	//회원상태가 탈퇴인 회원리스트 출력
	public List<MemberDto> selectMemberLeave() {
		logger.info("selectMemberLeave() MemberService.java");
		
		List<MemberDto> selectLeaveMember =  memberDao.selectMemberLeave();
		for(int i=0; i<selectLeaveMember.size(); i++) {
			logger.info("selectLeaveMember : {}", selectLeaveMember.get(i));
		}		
		return selectLeaveMember;
	}
	//내부회원 가입 메서드 :total(모든회원)과 info(내부회원)로 나눈 후 각각 테이블에 get
	public void insertMember(MemberDto memberDto) {
		logger.info("insertMember() MemberService.java");
		
		memberTotalInsertDto.setMemberId(memberDto.getMemberId());
		memberTotalInsertDto.setMemberName(memberDto.getMemberName());
		memberTotalInsertDto.setMemberIdCheck(memberDto.getMemberIdCheck());
		logger.info("memberTotalInsertDto : {}", memberTotalInsertDto);

		memberInfoDto.setMemberId(memberDto.getMemberId());
		memberInfoDto.setMemberInfoPassword(memberDto.getMemberInfoPassword());
		memberInfoDto.setMemberInfoBirth(memberDto.getMemberInfoBirth());
		memberInfoDto.setMemberInfoGender(memberDto.getMemberInfoGender());
		memberInfoDto.setMemberInfoEmail(memberDto.getMemberInfoEmail());
		logger.info("memberInfoDto : {}", memberInfoDto);
		
		memberDao.insertMemberTotal(memberTotalInsertDto);
		memberDao.insertMemberInfo(memberInfoDto);
	}
	
	//외부회원 가입 메서드  :total(모든회원)테이블에만 입력
	public void inserLinkMember(MemberTotalDto memberTotalDto) {
		logger.info("insertMember() MemberService.java");
		
		memberTotalInsertDto.setMemberId(memberTotalDto.getMemberId());
		memberTotalInsertDto.setMemberName(memberTotalDto.getMemberName());
		memberTotalInsertDto.setMemberIdCheck(memberTotalDto.getMemberIdCheck());
		logger.info("memberTotalInsertDto : {}", memberTotalInsertDto);
		memberDao.insertMemberTotal(memberTotalInsertDto);
	}
}
