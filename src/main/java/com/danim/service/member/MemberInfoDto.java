package com.danim.service.member;

import org.springframework.stereotype.Component;

@Component
public class MemberInfoDto {
	private String memberId;
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
		return "MemberInfoDto [memberId=" + memberId + ", memberInfoPassword=" + memberInfoPassword
				+ ", memberInfoBirth=" + memberInfoBirth + ", memberInfoGender=" + memberInfoGender
				+ ", memberInfoEmail=" + memberInfoEmail + "]";
	}
	
}
