package com.danim.service.member;
//정지회원 DTO
public class MemberBanDto {
	private String memberBanNo;
	private String memberId;
	private String memberBanStartDate;
	private String memberBanEndDate;
	private String memberBanReason;
	private String communityNo;
	private String replyNo;
	
	public String getMemberBanNo() {
		return memberBanNo;
	}
	public void setMemberBanNo(String memberBanNo) {
		this.memberBanNo = memberBanNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberBanStartDate() {
		return memberBanStartDate;
	}
	public void setMemberBanStartDate(String memberBanStartDate) {
		this.memberBanStartDate = memberBanStartDate;
	}
	public String getMemberBanEndDate() {
		return memberBanEndDate;
	}
	public void setMemberBanEndDate(String memberBanEndDate) {
		this.memberBanEndDate = memberBanEndDate;
	}
	public String getMemberBanReason() {
		return memberBanReason;
	}
	public void setMemberBanReason(String memberBanReason) {
		this.memberBanReason = memberBanReason;
	}
	public String getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(String communityNo) {
		this.communityNo = communityNo;
	}
	public String getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}
	
	@Override
	public String toString() {
		return "MemberBanDto [memberBanNo=" + memberBanNo + ", memberId=" + memberId + ", memberBanStartDate="
				+ memberBanStartDate + ", memberBanEndDate=" + memberBanEndDate + ", memberBanReason=" + memberBanReason
				+ ", communityNo=" + communityNo + ", replyNo=" + replyNo + "]";
	}
}
