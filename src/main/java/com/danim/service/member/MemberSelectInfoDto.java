package com.danim.service.member;
//회원정보조회 DTO
public class MemberSelectInfoDto {
	private String memberId;
	private String memberName;
	private String memberInfoBirth;
	private String memberInfoGender;
	private String memberInfoEmail;
	private String memberDate;
	
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
	public String getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(String memberDate) {
		this.memberDate = memberDate;
	}
	
	@Override
	public String toString() {
		return "MemberSelectInfoDto [memberId=" + memberId + ", memberName=" + memberName + ", memberInfoBirth="
				+ memberInfoBirth + ", memberInfoGender=" + memberInfoGender + ", memberInfoEmail=" + memberInfoEmail
				+ ", memberDate=" + memberDate + "]";
	}
}
