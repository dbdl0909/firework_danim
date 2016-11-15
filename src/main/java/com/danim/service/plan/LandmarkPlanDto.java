package com.danim.service.plan;

public class LandmarkPlanDto {
	private int landmarkPlanNo;
	private int planNo;
	private int cityRouteNo;
	private String landmarkInfoNo;
	
	public int getLandmarkPlanNo() {
		return landmarkPlanNo;
	}
	public void setLandmarkPlanNo(int landmarkPlanNo) {
		this.landmarkPlanNo = landmarkPlanNo;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public int getCityRouteNo() {
		return cityRouteNo;
	}
	public void setCityRouteNo(int cityRouteNo) {
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
		return "LandmarkPlanDto [landmarkPlanNo=" + landmarkPlanNo + ", planNo=" + planNo + ", cityRouteNo="
				+ cityRouteNo + ", landmarkInfoNo=" + landmarkInfoNo + "]";
	}
}
