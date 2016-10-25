package com.danim.service.member;

public class MemberDto {
	private String memberId;
	private String memberName;
	private String memberDate;
	private String memberUpdate;
	private char memberIdCheck;
	private String memberInfoPassword;
	private String memberInfoBirth;
	private String memberInfoGender;
	private String memberInfoEmail;
	
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
	public char getMemberIdCheck() {
		return memberIdCheck;
	}
	public void setMemberIdCheck(char memberIdCheck) {
		this.memberIdCheck = memberIdCheck;
	}
	public String getMemberInfoPassword() {
		return memberInfoPassword;
	}
	public void setMemberInfoPassword(String memberInfoPassword) {
		this.memberInfoPassword = memberInfoPassword;
	}
	public String getMemberInfoBirth() {
		return memberInfoBirth;
	}
	public void setMemberInfoBirth(String memberInfoBirth) {
		this.memberInfoBirth = memberInfoBirth;
	}
	public String getMemberInfoGender() {
		return memberInfoGender;
	}
	public void setMemberInfoGender(String memberInfoGender) {
		this.memberInfoGender = memberInfoGender;
	}
	public String getMemberInfoEmail() {
		return memberInfoEmail;
	}
	public void setMemberInfoEmail(String memberInfoEmail) {
		this.memberInfoEmail = memberInfoEmail;
	}
	
	@Override
	public String toString() {
		return "MemberDto [memberId=" + memberId + ", memberName=" + memberName + ", memberDate=" + memberDate
				+ ", memberUpdate=" + memberUpdate + ", memberIdCheck=" + memberIdCheck + ", memberInfoPassword="
				+ memberInfoPassword + ", memberInfoBirth=" + memberInfoBirth + ", memberInfoGender=" + memberInfoGender
				+ ", memberInfoEmail=" + memberInfoEmail + "]";
	}
}
