package com.danim.service.plan;

public class StayInfoDto {				//	stay_info table
	private String stayInfoNo;			//숙박번호	stay_info_no
	private String stayInfoName;		//숙박명	stay_info_name
	private String cityInfoNo;			//시청번호	city_info_no
	private String stayInfoHomepage;	//홈페이지	stay_info_homepage
	private int stayInfoStandard;		//스탠다드	stay_info_standard
	private int stayInfoDeluxe;			//디럭스	stay_info_deluxe
	private int stayInfoSuite;			//스위트	stay_info_suite
	
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
	public String getCityInfoNo() {
		return cityInfoNo;
	}
	public void setCityInfoNo(String cityInfoNo) {
		this.cityInfoNo = cityInfoNo;
	}
	public String getStayInfoHomepage() {
		return stayInfoHomepage;
	}
	public void setStayInfoHomepage(String stayInfoHomepage) {
		this.stayInfoHomepage = stayInfoHomepage;
	}
	public int getStayInfoStandard() {
		return stayInfoStandard;
	}
	public void setStayInfoStandard(int stayInfoStandard) {
		this.stayInfoStandard = stayInfoStandard;
	}
	public int getStayInfoDeluxe() {
		return stayInfoDeluxe;
	}
	public void setStayInfoDeluxe(int stayInfoDeluxe) {
		this.stayInfoDeluxe = stayInfoDeluxe;
	}
	public int getStayInfoSuite() {
		return stayInfoSuite;
	}
	public void setStayInfoSuite(int stayInfoSuite) {
		this.stayInfoSuite = stayInfoSuite;
	}
	
	@Override
	public String toString() {
		return "StayInfoDto [stayInfoNo=" + stayInfoNo + ", stayInfoName=" + stayInfoName + ", cityInfoNo=" + cityInfoNo
				+ ", stayInfoHomepage=" + stayInfoHomepage + ", stayInfoStandard=" + stayInfoStandard
				+ ", stayInfoDeluxe=" + stayInfoDeluxe + ", stayInfoSuite=" + stayInfoSuite + "]";
	}
}
