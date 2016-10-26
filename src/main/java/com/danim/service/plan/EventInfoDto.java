package com.danim.service.plan;

import java.util.Date;

public class EventInfoDto {
	private String eventInfoName;			// 행사이름
	private String cityInfoNo;				// 도시번호
	private String eventInfoVenue;			// 개최장소
	private Date eventInfoStart; 			// 행사시작일자
	private Date eventInfoEnd;				// 행사종료일자
	private String eventInfoContent;		// 행사내용
	private String eventInfoOrganizer;		// 주최기관
	private String eventInfoContact;		// 연락처
	private String eventInfoHomepage;		// 행사홈페이지
	private String eventInfoAddress;		// 행사주소
	private Date eventInfoReferenceDate;	// 데이터기준일자
	
	public String getEventInfoName() {
		return eventInfoName;
	}
	public void setEventInfoName(String eventInfoName) {
		this.eventInfoName = eventInfoName;
	}
	public String getCityInfoNo() {
		return cityInfoNo;
	}
	public void setCityInfoNo(String cityInfoNo) {
		this.cityInfoNo = cityInfoNo;
	}
	public String getEventInfoVenue() {
		return eventInfoVenue;
	}
	public void setEventInfoVenue(String eventInfoVenue) {
		this.eventInfoVenue = eventInfoVenue;
	}
	public Date getEventInfoStart() {
		return eventInfoStart;
	}
	public void setEventInfoStart(Date eventInfoStart) {
		this.eventInfoStart = eventInfoStart;
	}
	public Date getEventInfoEnd() {
		return eventInfoEnd;
	}
	public void setEventInfoEnd(Date eventInfoEnd) {
		this.eventInfoEnd = eventInfoEnd;
	}
	public String getEventInfoContent() {
		return eventInfoContent;
	}
	public void setEventInfoContent(String eventInfoContent) {
		this.eventInfoContent = eventInfoContent;
	}
	public String getEventInfoOrganizer() {
		return eventInfoOrganizer;
	}
	public void setEventInfoOrganizer(String eventInfoOrganizer) {
		this.eventInfoOrganizer = eventInfoOrganizer;
	}
	public String getEventInfoContact() {
		return eventInfoContact;
	}
	public void setEventInfoContact(String eventInfoContact) {
		this.eventInfoContact = eventInfoContact;
	}
	public String getEventInfoHomepage() {
		return eventInfoHomepage;
	}
	public void setEventInfoHomepage(String eventInfoHomepage) {
		this.eventInfoHomepage = eventInfoHomepage;
	}
	public String getEventInfoAddress() {
		return eventInfoAddress;
	}
	public void setEventInfoAddress(String eventInfoAddress) {
		this.eventInfoAddress = eventInfoAddress;
	}
	public Date getEventInfoReferenceDate() {
		return eventInfoReferenceDate;
	}
	public void setEventInfoReferenceDate(Date eventInfoReferenceDate) {
		this.eventInfoReferenceDate = eventInfoReferenceDate;
	}
	
	@Override
	public String toString() {
		return "EventInfoDto [eventInfoName=" + eventInfoName + ", cityInfoNo=" + cityInfoNo + ", eventInfoVenue="
				+ eventInfoVenue + ", eventInfoStart=" + eventInfoStart + ", eventInfoEnd=" + eventInfoEnd
				+ ", eventInfoContent=" + eventInfoContent + ", eventInfoOrganizer=" + eventInfoOrganizer
				+ ", eventInfoContact=" + eventInfoContact + ", eventInfoHomepage=" + eventInfoHomepage
				+ ", eventInfoAddress=" + eventInfoAddress + ", eventInfoReferenceDate=" + eventInfoReferenceDate + "]";
	}
	
}
