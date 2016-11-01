package com.danim.service.community;

import java.util.Date;

import com.danim.util.Pagination;

public class CommunityDto{

	private String communityNo;
	private char communityBan;
	private String communityBanReason;
	private String communityCategoryNo;
	private String planNo;
	private String memberId;
	private String communitySubject;
	private String communityContent;
	private Integer communityReadcount;
	private Integer communityRating;
	private String communityNotice;
	private Date communityDate;
	private Date communityUpdate;
	private Integer communityReportCount;
	private Integer communityReplyCount;
	public String getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(String communityNo) {
		this.communityNo = communityNo;
	}
	public char getCommunityBan() {
		return communityBan;
	}
	public void setCommunityBan(char communityBan) {
		this.communityBan = communityBan;
	}
	public String getCommunityBanReason() {
		return communityBanReason;
	}
	public void setCommunityBanReason(String communityBanReason) {
		this.communityBanReason = communityBanReason;
	}
	public String getCommunityCategoryNo() {
		return communityCategoryNo;
	}
	public void setCommunityCategoryNo(String communityCategoryNo) {
		this.communityCategoryNo = communityCategoryNo;
	}
	public String getPlanNo() {
		return planNo;
	}
	public void setPlanNo(String planNo) {
		this.planNo = planNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getCommunitySubject() {
		return communitySubject;
	}
	public void setCommunitySubject(String communitySubject) {
		this.communitySubject = communitySubject;
	}
	public String getCommunityContent() {
		return communityContent;
	}
	public void setCommunityContent(String communityContent) {
		this.communityContent = communityContent;
	}
	public Integer getCommunityReadcount() {
		return communityReadcount;
	}
	public void setCommunityReadcount(Integer communityReadcount) {
		this.communityReadcount = communityReadcount;
	}
	public Integer getCommunityRating() {
		return communityRating;
	}
	public void setCommunityRating(Integer communityRating) {
		this.communityRating = communityRating;
	}
	public String getCommunityNotice() {
		return communityNotice;
	}
	public void setCommunityNotice(String communityNotice) {
		this.communityNotice = communityNotice;
	}
	
	public Date getCommunityDate() {
		return communityDate;
	}
	public void setCommunityDate(Date communityDate) {
		this.communityDate = communityDate;
	}
	
	public Date getCommunityUpdate() {
		return communityUpdate;
	}
	
	public void setCommunityUpdate(Date communityUpdate) {
		this.communityUpdate = communityUpdate;
	}
	
	public Integer getCommunityReportCount() {
		return communityReportCount;
	}
	public void setCommunityReportCount(Integer communityReportCount) {
		this.communityReportCount = communityReportCount;
	}
	public Integer getCommunityReplyCount() {
		return communityReplyCount;
	}
	public void setCommunityReplyCount(Integer communityReplyCount) {
		this.communityReplyCount = communityReplyCount;
	}
	
	/*@Override
	public String toString() {
		return "CommunityDto [communityNo=" + communityNo + ", communityBan=" + communityBan + ", communityBanReason="
				+ communityBanReason + ", communityCategoryNo=" + communityCategoryNo + ", planNo=" + planNo
				+ ", memberId=" + memberId + ", communitySubject=" + communitySubject + ", communityContent="
				+ communityContent + ", communityReadcount=" + communityReadcount + ", communityRating="
				+ communityRating + ", communityNotice=" + communityNotice + ", communityDate=" + communityDate
				+ ", communityUpdate=" + communityUpdate + ", communityReportCount=" + communityReportCount
				+ ", communityReplyCount=" + communityReplyCount + "]";
	}*/
	
}
