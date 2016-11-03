package com.danim.service.index;

public class IndexLandmarkImageDto {
	private String cityInfoNo;
	private String landmarkInfoImage;
	
	public String getCityInfoNo() {
		return cityInfoNo;
	}
	public void setCityInfoNo(String cityInfoNo) {
		this.cityInfoNo = cityInfoNo;
	}
	public String getLandmarkInfoImage() {
		return landmarkInfoImage;
	}
	public void setLandmarkInfoImage(String landmarkInfoImage) {
		this.landmarkInfoImage = landmarkInfoImage;
	}
	
	@Override
	public String toString() {
		return "IndexLandmarkImageDto [cityInfoNo=" + cityInfoNo + ", landmarkInfoImage=" + landmarkInfoImage + "]";
	}
	
}
