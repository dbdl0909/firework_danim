package com.danim.service.plan;

public class CityInfoDto {					//		city_info table
	private String cityInfoNo;				//시청번호 		city_info_no
	private String cityInfoDoName;			//도명 			city_info_do_name
	private String cityInfoName;			//시청소재지명 	city_info_name
	private float cityInfoLangitude;		//경도 			city_info_langitude
	private float cityInfoLatitude;			//위도 			city_info_latitude
	private String cityInfoSummary;			//개요 			city_info_summary
	private String cityInfoImage;			//이미지 		city_info_image
	
	public String getCityInfoNo() {
		return cityInfoNo;
	}
	public void setCityInfoNo(String cityInfoNo) {
		this.cityInfoNo = cityInfoNo;
	}
	public String getCityInfoDoName() {
		return cityInfoDoName;
	}
	public void setCityInfoDoName(String cityInfoDoName) {
		this.cityInfoDoName = cityInfoDoName;
	}
	public String getCityInfoName() {
		return cityInfoName;
	}
	public void setCityInfoName(String cityInfoName) {
		this.cityInfoName = cityInfoName;
	}
	public float getCityInfoLangitude() {
		return cityInfoLangitude;
	}
	public void setCityInfoLangitude(float cityInfoLangitude) {
		this.cityInfoLangitude = cityInfoLangitude;
	}
	public float getCityInfoLatitude() {
		return cityInfoLatitude;
	}
	public void setCityInfoLatitude(float cityInfoLatitude) {
		this.cityInfoLatitude = cityInfoLatitude;
	}
	public String getCityInfoSummary() {
		return cityInfoSummary;
	}
	public void setCityInfoSummary(String cityInfoSummary) {
		this.cityInfoSummary = cityInfoSummary;
	}
	public String getCityInfoImage() {
		return cityInfoImage;
	}
	public void setCityInfoImage(String cityInfoImage) {
		this.cityInfoImage = cityInfoImage;
	}
	
	@Override
	public String toString() {
		return "CityInfoDto [cityInfoNo=" + cityInfoNo + ", cityInfoDoName=" + cityInfoDoName + ", cityInfoName="
				+ cityInfoName + ", cityInfoLangitude=" + cityInfoLangitude + ", cityInfoLatitude=" + cityInfoLatitude
				+ ", cityInfoSummary=" + cityInfoSummary + ", cityInfoImage=" + cityInfoImage + "]";
	}
}
