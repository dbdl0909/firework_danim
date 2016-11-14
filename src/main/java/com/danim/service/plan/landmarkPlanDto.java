package com.danim.service.plan;

public class landmarkPlanDto {
	private String landmarkPlanNo;
	private String planNo;
	private String cityRouteNo;
	private String landmarkInfoNo;
	
	public String getLandmarkPlanNo() {
		return landmarkPlanNo;
	}
	public void setLandmarkPlanNo(String landmarkPlanNo) {
		this.landmarkPlanNo = landmarkPlanNo;
	}
	public String getPlanNo() {
		return planNo;
	}
	public void setPlanNo(String planNo) {
		this.planNo = planNo;
	}
	public String getCityRouteNo() {
		return cityRouteNo;
	}
	public void setCityRouteNo(String cityRouteNo) {
		this.cityRouteNo = cityRouteNo;
	}
	public String getLandmarkInfoNo() {
		return landmarkInfoNo;
	}
	public void setLandmarkInfoNo(String landmarkInfoNo) {
		this.landmarkInfoNo = landmarkInfoNo;
	}
	
	@Override
	public String toString() {
		return "landmarkPlanDto [landmarkPlanNo=" + landmarkPlanNo + ", planNo=" + planNo + ", cityRouteNo="
				+ cityRouteNo + ", landmarkInfoNo=" + landmarkInfoNo + "]";
	}
}
