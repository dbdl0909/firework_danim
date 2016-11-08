package com.danim.service.member;
//내부회원 가입 DTO
import org.springframework.stereotype.Component;

@Component
public class MemberTotalInsertDto {
	private String memberId;
	private String memberName;
	private char memberIdCheck;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public char getMemberIdCheck() {
		return memberIdCheck;
	}
	public void setMemberIdCheck(char memberIdCheck) {
		this.memberIdCheck = memberIdCheck;
	}
	
	@Override
	public String toString() {
		return "MemberTotalInsertDto [memberId=" + memberId + ", memberName=" + memberName + ", memberIdCheck="
				+ memberIdCheck + "]";
	}
}
