package com.danim.service.member;

public class MemberDto {
	private String memberId;
	private String memberLevel;
	private String memberName;
	private String memberStatus;
	private String memberDate;
	private String memberUpdate;
	private String memberLoginCheck;
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
	public String getMemberLoginCheck() {
		return memberLoginCheck;
	}
	public void setMemberLoginCheck(String memberLoginCheck) {
		this.memberLoginCheck = memberLoginCheck;
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
		return "MemberDto [memberId=" + memberId + ", memberLevel=" + memberLevel + ", memberName=" + memberName
				+ ", memberStatus=" + memberStatus + ", memberDate=" + memberDate + ", memberUpdate=" + memberUpdate
				+ ", memberLoginCheck=" + memberLoginCheck + ", memberIdCheck=" + memberIdCheck
				+ ", memberInfoPassword=" + memberInfoPassword + ", memberInfoBirth=" + memberInfoBirth
				+ ", memberInfoGender=" + memberInfoGender + ", memberInfoEmail=" + memberInfoEmail + "]";
	}
}
