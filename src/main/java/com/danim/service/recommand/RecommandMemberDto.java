package com.danim.service.recommand;

public class RecommandMemberDto {
	
	int memberAge;
	String memberGender;
	
	public int getMemberAge() {
		return memberAge;
	}
	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	
	@Override
	public String toString() {
		return "RecommandMemberDto [memberAge=" + memberAge + ", memberGender=" + memberGender + "]";
	}
		
}
