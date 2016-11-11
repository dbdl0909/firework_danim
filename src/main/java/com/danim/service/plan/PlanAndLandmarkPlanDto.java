package com.danim.service.plan;

public class PlanAndLandmarkPlanDto {
	private String planName;
	private String planHeadcount;
	private String planType;
	private String startDate;
	private String endDate;
	private String stayDay;
	private String cityRouteStartDate;
	private String cityRouteDepartureCity;
	private String cityRouteArrivalCity;
	private String cityRouteDepartureTime;
	private String cityRouteArrivalTime;
	private String landmarkPlanNo;
	
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public String getPlanHeadcount() {
		return planHeadcount;
	}
	public void setPlanHeadcount(String planHeadcount) {
		this.planHeadcount = planHeadcount;
	}
	public String getPlanType() {
		return planType;
	}
	public void setPlanType(String planType) {
		this.planType = planType;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStayDay() {
		return stayDay;
	}
	public void setStayDay(String stayDay) {
		this.stayDay = stayDay;
	}
	public String getCityRouteStartDate() {
		return cityRouteStartDate;
	}
	public void setCityRouteStartDate(String cityRouteStartDate) {
		this.cityRouteStartDate = cityRouteStartDate;
	}
	public String getCityRouteDepartureCity() {
		return cityRouteDepartureCity;
	}
	public void setCityRouteDepartureCity(String cityRouteDepartureCity) {
		this.cityRouteDepartureCity = cityRouteDepartureCity;
	}
	public String getCityRouteArrivalCity() {
		return cityRouteArrivalCity;
	}
	public void setCityRouteArrivalCity(String cityRouteArrivalCity) {
		this.cityRouteArrivalCity = cityRouteArrivalCity;
	}
	public String getCityRouteDepartureTime() {
		return cityRouteDepartureTime;
	}
	public void setCityRouteDepartureTime(String cityRouteDepartureTime) {
		this.cityRouteDepartureTime = cityRouteDepartureTime;
	}
	public String getCityRouteArrivalTime() {
		return cityRouteArrivalTime;
	}
	public void setCityRouteArrivalTime(String cityRouteArrivalTime) {
		this.cityRouteArrivalTime = cityRouteArrivalTime;
	}
	public String getLandmarkPlanNo() {
		return landmarkPlanNo;
	}
	public void setLandmarkPlanNo(String landmarkPlanNo) {
		this.landmarkPlanNo = landmarkPlanNo;
	}
	
	@Override
	public String toString() {
		return "PlanAndLandmarkPlanDto [planName=" + planName + ", planHeadcount=" + planHeadcount + ", planType="
				+ planType + ", startDate=" + startDate + ", endDate=" + endDate + ", stayDay=" + stayDay
				+ ", cityRouteStartDate=" + cityRouteStartDate + ", cityRouteDepartureCity=" + cityRouteDepartureCity
				+ ", cityRouteArrivalCity=" + cityRouteArrivalCity + ", cityRouteDepartureTime="
				+ cityRouteDepartureTime + ", cityRouteArrivalTime=" + cityRouteArrivalTime + ", landmarkPlanNo="
				+ landmarkPlanNo + "]";
	}	
}
