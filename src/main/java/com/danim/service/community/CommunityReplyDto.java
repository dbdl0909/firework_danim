package com.danim.service.community;

import java.sql.Date;

public class CommunityReplyDto {
	private Integer replyNo;
	private Integer communityNo;
	private String communityCategoryNo;
	private String memberId;
	private String replyContent;
	private Date replyDate;
	
	public Integer getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(Integer replyNo) {
		this.replyNo = replyNo;
	}
	public Integer getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(Integer communityNo) {
		this.communityNo = communityNo;
	}
	public String getCommunityCategoryNo() {
		return communityCategoryNo;
	}
	public void setCommunityCategoryNo(String communityCategoryNo) {
		this.communityCategoryNo = communityCategoryNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	
	@Override
	public String toString() {
		return "CommunityReplyDto [replyNo=" + replyNo + ", communityNo=" + communityNo + ", communityCategoryNo="
				+ communityCategoryNo + ", memberId=" + memberId + ", replyContent=" + replyContent + ", replyDate="
				+ replyDate + "]";
	}
	
	
}
