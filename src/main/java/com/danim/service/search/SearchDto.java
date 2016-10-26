package com.danim.service.search;

public class SearchDto {
	private String cityInfoNo;				//	도시번호
	private String cityInfoName;			//	도시이름
	private String landmarkInfoNo;			//	명소번호
	private String landmarkInfoName;		//	명소이름
	private float landmarkInfoLangitude;	//	명소경도
	private float landmarkInfoLatitude;		//	명소위도
	private String eateryNo;				//	음식점번호
	private String eateryName;				//	음식점이름
	private String eventInfoName;			//	행사이름
	private String stayInfoNo;				//	숙소번호
	private String stayInfoName;			//	숙소이름
	
	public String getCityInfoNo() {
		return cityInfoNo;
	}
	public void setCityInfoNo(String cityInfoNo) {
		this.cityInfoNo = cityInfoNo;
	}
	public String getCityInfoName() {
		return cityInfoName;
	}
	public void setCityInfoName(String cityInfoName) {
		this.cityInfoName = cityInfoName;
	}
	public String getLandmarkInfoNo() {
		return landmarkInfoNo;
	}
	public void setLandmarkInfoNo(String landmarkInfoNo) {
		this.landmarkInfoNo = landmarkInfoNo;
	}
	public String getLandmarkInfoName() {
		return landmarkInfoName;
	}
	public void setLandmarkInfoName(String landmarkInfoName) {
		this.landmarkInfoName = landmarkInfoName;
	}
	public float getLandmarkInfoLangitude() {
		return landmarkInfoLangitude;
	}
	public void setLandmarkInfoLangitude(float landmarkInfoLangitude) {
		this.landmarkInfoLangitude = landmarkInfoLangitude;
	}
	public float getLandmarkInfoLatitude() {
		return landmarkInfoLatitude;
	}
	public void setLandmarkInfoLatitude(float landmarkInfoLatitude) {
		this.landmarkInfoLatitude = landmarkInfoLatitude;
	}
	public String getEateryNo() {
		return eateryNo;
	}
	public void setEateryNo(String eateryNo) {
		this.eateryNo = eateryNo;
	}
	public String getEateryName() {
		return eateryName;
	}
	public void setEateryName(String eateryName) {
		this.eateryName = eateryName;
	}
	public String getEventInfoName() {
		return eventInfoName;
	}
	public void setEventInfoName(String eventInfoName) {
		this.eventInfoName = eventInfoName;
	}
	public String getStayInfoNo() {
		return stayInfoNo;
	}
	public void setStayInfoNo(String stayInfoNo) {
		this.stayInfoNo = stayInfoNo;
	}
	public String getStayInfoName() {
		return stayInfoName;
	}
	public void setStayInfoName(String stayInfoName) {
		this.stayInfoName = stayInfoName;
	}
	
	@Override
	public String toString() {
		return "SearchDto [cityInfoNo=" + cityInfoNo + ", cityInfoName=" + cityInfoName + ", landmarkInfoNo="
				+ landmarkInfoNo + ", landmarkInfoName=" + landmarkInfoName + ", landmarkInfoLangitude="
				+ landmarkInfoLangitude + ", landmarkInfoLatitude=" + landmarkInfoLatitude + ", eateryNo=" + eateryNo
				+ ", eateryName=" + eateryName + ", eventInfoName=" + eventInfoName + ", stayInfoNo=" + stayInfoNo
				+ ", stayInfoName=" + stayInfoName + ", getCityInfoNo()=" + getCityInfoNo() + ", getCityInfoName()="
				+ getCityInfoName() + ", getLandmarkInfoNo()=" + getLandmarkInfoNo() + ", getLandmarkInfoName()="
				+ getLandmarkInfoName() + ", getLandmarkInfoLangitude()=" + getLandmarkInfoLangitude()
				+ ", getLandmarkInfoLatitude()=" + getLandmarkInfoLatitude() + ", getEateryNo()=" + getEateryNo()
				+ ", getEateryName()=" + getEateryName() + ", getEventInfoName()=" + getEventInfoName()
				+ ", getStayInfoNo()=" + getStayInfoNo() + ", getStayInfoName()=" + getStayInfoName() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

}
