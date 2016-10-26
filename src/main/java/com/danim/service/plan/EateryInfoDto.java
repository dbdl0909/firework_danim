package com.danim.service.plan;

public class EateryInfoDto {
	private String eateryNo;		// 음식점 번호
	private String eateryName;		// 음식점 이름
	private String eateryCategory;	// 음식점 분류
	private String cityInfoNo;		// 도시 번호
	private String eaterySummary;	// 음식점 설명
	
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
	public String getEateryCategory() {
		return eateryCategory;
	}
	public void setEateryCategory(String eateryCategory) {
		this.eateryCategory = eateryCategory;
	}
	public String getCityInfoNo() {
		return cityInfoNo;
	}
	public void setCityInfoNo(String cityInfoNo) {
		this.cityInfoNo = cityInfoNo;
	}
	public String getEaterySummary() {
		return eaterySummary;
	}
	public void setEaterySummary(String eaterySummary) {
		this.eaterySummary = eaterySummary;
	}
	
	@Override
	public String toString() {
		return "EateryInfoDto [eateryNo=" + eateryNo + ", eateryName=" + eateryName + ", eateryCategory="
				+ eateryCategory + ", cityInfoNo=" + cityInfoNo + ", eaterySummary=" + eaterySummary + "]";
	}
	
}
