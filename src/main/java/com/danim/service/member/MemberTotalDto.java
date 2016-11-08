package com.danim.service.member;
//전체회원 DTO
import org.springframework.stereotype.Component;

@Component
public class MemberTotalDto {
	private String memberId;
	private String memberLevel;
	private String memberName;
	private String memberStatus;
	private String memberDate;
	private String memberUpdate;
	private char memberLoginCheck;
	private char memberIdCheck;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
	public String getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(String memberDate) {
		this.memberDate = memberDate;
	}
	public String getMemberUpdate() {
		return memberUpdate;
	}
	public void setMemberUpdate(String memberUpdate) {
		this.memberUpdate = memberUpdate;
	}
	public char getMemberLoginCheck() {
		return memberLoginCheck;
	}
	public void setMemberLoginCheck(char memberLoginCheck) {
		this.memberLoginCheck = memberLoginCheck;
	}
	public char getMemberIdCheck() {
		return memberIdCheck;
	}
	public void setMemberIdCheck(char memberIdCheck) {
		this.memberIdCheck = memberIdCheck;
	}
	
	@Override
	public String toString() {
		return "MemberTotlaDto [memberId=" + memberId + ", memberLevel=" + memberLevel + ", memberName=" + memberName
				+ ", memberStatus=" + memberStatus + ", memberDate=" + memberDate + ", memberUpdate=" + memberUpdate
				+ ", memberLoginCheck=" + memberLoginCheck + ", memberIdCheck=" + memberIdCheck + "]";
	}
}
