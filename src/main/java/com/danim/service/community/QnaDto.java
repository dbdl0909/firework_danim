package com.danim.service.community;

import java.util.Date;

public class QnaDto {

	private String communityNo;
	private String communityCategoryNo;
	private String planNo;
	private String memberId;
	private String communitySubject;
	private String communityContent;
	private Integer communityReadcount;
	private Date communityDate;
	private Date communityUpdate;
	private Integer communityReplyCount;
	
	public String getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(String communityNo) {
		this.communityNo = communityNo;
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
	public Integer getCommunityReplyCount() {
		return communityReplyCount;
	}
	public void setCommunityReplyCount(Integer communityReplyCount) {
		this.communityReplyCount = communityReplyCount;
	}
	
	@Override
	public String toString() {
		return "QnaDto [communityNo=" + communityNo + ", communityCategoryNo=" + communityCategoryNo + ", planNo="
				+ planNo + ", memberId=" + memberId + ", communitySubject=" + communitySubject + ", communityContent="
				+ communityContent + ", communityReadcount=" + communityReadcount + ", communityDate=" + communityDate
				+ ", communityUpdate=" + communityUpdate + ", communityReplyCount=" + communityReplyCount + "]";
	}
	
}
