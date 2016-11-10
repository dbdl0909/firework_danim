package com.danim.service.community;

public class ReportDto {
	private String memberId;
	private int communityNo;
	private int replyNo;
	private String reportReason;
	private String reportDate;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReportReason() {
		return reportReason;
	}
	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	
	@Override
	public String toString() {
		return "ReportDto [memberId=" + memberId + ", communityNo=" + communityNo + ", replyNo=" + replyNo
				+ ", reportReason=" + reportReason + ", reportDate=" + reportDate + "]";
	}
}
