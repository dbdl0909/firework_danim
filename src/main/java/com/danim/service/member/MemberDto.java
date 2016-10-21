package com.danim.service.member;

public class MemberDto {
	private String memberId;
	private String memberLevel;
	private String memberPassword;
	private String memberStatus;
	private String memberName;
	private String memberBirth;
	private char memberGender;
	private String memberEmail;
	private String memberDate;
	private String memberUpdate;
	private char memberLoginCheck;
	
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
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}
	public char getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(char memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
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
	
	@Override
	public String toString() {
		return "MemberDto [memberId=" + memberId + ", memberLevel=" + memberLevel + ", memberPassword=" + memberPassword
				+ ", memberStatus=" + memberStatus + ", memberName=" + memberName + ", memberBirth=" + memberBirth
				+ ", memberGender=" + memberGender + ", memberEmail=" + memberEmail + ", memberDate=" + memberDate
				+ ", memberUpdate=" + memberUpdate + ", memberLoginCheck=" + memberLoginCheck + "]";
	}	
	}
