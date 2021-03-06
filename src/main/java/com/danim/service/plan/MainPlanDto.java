package com.danim.service.plan;

import java.util.ArrayList;
import java.util.Arrays;

public class MainPlanDto {
	private String memberId;
	private String planName;
	private int planHeadcount;
	private String planType;
	private String planMemo;
	private String startDate;
	private String endDate;
	private int stayDay;
	private ArrayList<String> cityRouteStartDate;
	private ArrayList<String> cityRouteDepartureCity;
	private ArrayList<String> cityRouteArrivalCity;
	private ArrayList<String> cityRouteDepartureTime;
	private ArrayList<String> cityRouteArrivalTime;
	private ArrayList<Integer> cityRouteMemoIndex;
	private ArrayList<String> cityRouteMemo;
	private ArrayList<Integer> landmarkIndex;
	private ArrayList<String> landmarkInfoNo;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public int getPlanHeadcount() {
		return planHeadcount;
	}
	public void setPlanHeadcount(int planHeadcount) {
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
	public int getStayDay() {
		return stayDay;
	}
	public void setStayDay(int stayDay) {
		this.stayDay = stayDay;
	}
	public String getPlanMemo() {
		return planMemo;
	}
	public void setPlanMemo(String planMemo) {
		this.planMemo = planMemo;
	}
	public ArrayList<String> getCityRouteStartDate() {
		return cityRouteStartDate;
	}
	public void setCityRouteStartDate(ArrayList<String> cityRouteStartDate) {
		this.cityRouteStartDate = cityRouteStartDate;
	}
	public ArrayList<String> getCityRouteDepartureCity() {
		return cityRouteDepartureCity;
	}
	public void setCityRouteDepartureCity(ArrayList<String> cityRouteDepartureCity) {
		this.cityRouteDepartureCity = cityRouteDepartureCity;
	}
	public ArrayList<String> getCityRouteArrivalCity() {
		return cityRouteArrivalCity;
	}
	public void setCityRouteArrivalCity(ArrayList<String> cityRouteArrivalCity) {
		this.cityRouteArrivalCity = cityRouteArrivalCity;
	}
	public ArrayList<String> getCityRouteDepartureTime() {
		return cityRouteDepartureTime;
	}
	public void setCityRouteDepartureTime(ArrayList<String> cityRouteDepartureTime) {
		this.cityRouteDepartureTime = cityRouteDepartureTime;
	}
	public ArrayList<String> getCityRouteArrivalTime() {
		return cityRouteArrivalTime;
	}
	public void setCityRouteArrivalTime(ArrayList<String> cityRouteArrivalTime) {
		this.cityRouteArrivalTime = cityRouteArrivalTime;
	}
	public ArrayList<String> getCityRouteMemo() {
		return cityRouteMemo;
	}
	public void setCityRouteMemo(ArrayList<String> cityRouteMemo) {
		this.cityRouteMemo = cityRouteMemo;
	}
	public ArrayList<String> getLandmarkInfoNo() {
		return landmarkInfoNo;
	}
	public void setLandmarkInfoNo(ArrayList<String> landmarkInfoNo) {
		this.landmarkInfoNo = landmarkInfoNo;
	}
	public ArrayList<Integer> getLandmarkIndex() {
		return landmarkIndex;
	}
	public void setLandmarkIndex(ArrayList<Integer> landmarkIndex) {
		this.landmarkIndex = landmarkIndex;
	}
	public ArrayList<Integer> getCityRouteMemoIndex() {
		return cityRouteMemoIndex;
	}
	public void setCityRouteMemoIndex(ArrayList<Integer> cityRouteMemoIndex) {
		this.cityRouteMemoIndex = cityRouteMemoIndex;
	}
	
	@Override
	public String toString() {
		return "MainPlanDto [memberId=" + memberId + ", planName=" + planName + ", planHeadcount=" + planHeadcount
				+ ", planType=" + planType + ", planMemo=" + planMemo + ", startDate=" + startDate + ", endDate="
				+ endDate + ", stayDay=" + stayDay + ", cityRouteStartDate=" + cityRouteStartDate
				+ ", cityRouteDepartureCity=" + cityRouteDepartureCity + ", cityRouteArrivalCity="
				+ cityRouteArrivalCity + ", cityRouteDepartureTime=" + cityRouteDepartureTime
				+ ", cityRouteArrivalTime=" + cityRouteArrivalTime + ", cityRouteMemoIndex=" + cityRouteMemoIndex
				+ ", cityRouteMemo=" + cityRouteMemo + ", landmarkIndex=" + landmarkIndex + ", landmarkInfoNo="
				+ landmarkInfoNo + "]";
	}
}