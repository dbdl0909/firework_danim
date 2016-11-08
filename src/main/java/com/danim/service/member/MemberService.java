package com.danim.service.member;

import java.util.List;

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
	public MemberDto memberinfo(String memberId) {
		MemberDto memberDto = memberDao.memberinfo(memberId);
		return memberDto;
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
	public int selectMemberCheck(String memberId, String memberInfoPassword) {
		logger.info("selectMemberCheck() MemberService.java");
		int index = memberDao.memberCheck(memberId, memberInfoPassword);
		if(index == 0) {
			logger.info("일치하는 아이디 없음");
		} else {
			logger.info("일치하는 아이디 있음");
		}
		return index;
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
}