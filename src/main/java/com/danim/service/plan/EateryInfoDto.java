package com.danim.service.plan;

public class EateryInfoDto {				//		eatery_info table
	private String landmarkInfoNo;			//명소번호					landmark_info_no
	private String landmarkInfoName;		//명소명					landmark_info_name
	private String cityInfoNo;				//시청번호					city_info_no
	private String landmarkInfoLocation;	//상세위치					landmark_info_location
	private String landmarkInfoHomepage;	//홈페이지					landmark_info_homepage
	private String landmarkInfoSummary;		//설명						landmark_info_summary
	private float landmarkInfoLangitude;	//경도						landmark_info_langitude
	private float landmarkInfoLatitude;		//위도						landmark_info_latitude
	private String landmarkInfoImage;		//이미지경로/도시번호.jpg	landmark_info_image
	private int landmarkInfoFee;			//입장료					landmark_info_fee
	
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
	public String getCityInfoNo() {
		return cityInfoNo;
	}
	public void setCityInfoNo(String cityInfoNo) {
		this.cityInfoNo = cityInfoNo;
	}
	public String getLandmarkInfoLocation() {
		return landmarkInfoLocation;
	}
	public void setLandmarkInfoLocation(String landmarkInfoLocation) {
		this.landmarkInfoLocation = landmarkInfoLocation;
	}
	public String getLandmarkInfoHomepage() {
		return landmarkInfoHomepage;
	}
	public void setLandmarkInfoHomepage(String landmarkInfoHomepage) {
		this.landmarkInfoHomepage = landmarkInfoHomepage;
	}
	public String getLandmarkInfoSummary() {
		return landmarkInfoSummary;
	}
	public void setLandmarkInfoSummary(String landmarkInfoSummary) {
		this.landmarkInfoSummary = landmarkInfoSummary;
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
	public String getLandmarkInfoImage() {
		return landmarkInfoImage;
	}
	public void setLandmarkInfoImage(String landmarkInfoImage) {
		this.landmarkInfoImage = landmarkInfoImage;
	}
	public int getLandmarkInfoFee() {
		return landmarkInfoFee;
	}
	public void setLandmarkInfoFee(int landmarkInfoFee) {
		this.landmarkInfoFee = landmarkInfoFee;
	}
	
	@Override
	public String toString() {
		return "EateryInfoDto [landmarkInfoNo=" + landmarkInfoNo + ", landmarkInfoName=" + landmarkInfoName
				+ ", cityInfoNo=" + cityInfoNo + ", landmarkInfoLocation=" + landmarkInfoLocation
				+ ", landmarkInfoHomepage=" + landmarkInfoHomepage + ", landmarkInfoSummary=" + landmarkInfoSummary
				+ ", landmarkInfoLangitude=" + landmarkInfoLangitude + ", landmarkInfoLatitude=" + landmarkInfoLatitude
				+ ", landmarkInfoImage=" + landmarkInfoImage + ", landmarkInfoFee=" + landmarkInfoFee + "]";
	}
}
