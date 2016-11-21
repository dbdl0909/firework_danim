package com.danim.service.community;

public class ReportDto {
	private int reportNo;
	private String memberId;
	private int communityNo;
	private int replyNo;
	private String reportReason;
	private String reportDate;
	private int reportCount;
	
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
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
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	
	@Override
	public String toString() {
		return "ReportDto [reportNo=" + reportNo + ", memberId=" + memberId + ", communityNo=" + communityNo
				+ ", replyNo=" + replyNo + ", reportReason=" + reportReason + ", reportDate=" + reportDate
				+ ", reportCount=" + reportCount + "]";
	}
}
