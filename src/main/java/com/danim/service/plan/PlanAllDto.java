package com.danim.service.plan;

import java.sql.Date;
import java.sql.Time;

import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Text;


public class PlanAllDto {
	private String planNo;
	private String cityRouteNo;
	private Date cityRouteDate;
	private String cityRouteDepartureCity;
	private String cityRouteArrivalCity;
	private Time cityRouteDepartureTime;
	private Time cityRouteArrivalTime;
	private Text cityRouteMemo;
	
	private String landmarkPlanNo;
	private String landmarkInfoNo;


	private String stayPlanNo;
	private String stayInfoNo;
	private Time stayPlanTime;
	private String stayPlanMemo;
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
	public Date getCityRouteDate() {
		return cityRouteDate;
	}
	public void setCityRouteDate(Date cityRouteDate) {
		this.cityRouteDate = cityRouteDate;
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
	public Time getCityRouteDepartureTime() {
		return cityRouteDepartureTime;
	}
	public void setCityRouteDepartureTime(Time cityRouteDepartureTime) {
		this.cityRouteDepartureTime = cityRouteDepartureTime;
	}
	public Time getCityRouteArrivalTime() {
		return cityRouteArrivalTime;
	}
	public void setCityRouteArrivalTime(Time cityRouteArrivalTime) {
		this.cityRouteArrivalTime = cityRouteArrivalTime;
	}
	public Text getCityRouteMemo() {
		return cityRouteMemo;
	}
	public void setCityRouteMemo(Text cityRouteMemo) {
		this.cityRouteMemo = cityRouteMemo;
	}
	public String getLandmarkPlanNo() {
		return landmarkPlanNo;
	}
	public void setLandmarkPlanNo(String landmarkPlanNo) {
		this.landmarkPlanNo = landmarkPlanNo;
	}
	public String getLandmarkInfoNo() {
		return landmarkInfoNo;
	}
	public void setLandmarkInfoNo(String landmarkInfoNo) {
		this.landmarkInfoNo = landmarkInfoNo;
	}
	public String getStayPlanNo() {
		return stayPlanNo;
	}
	public void setStayPlanNo(String stayPlanNo) {
		this.stayPlanNo = stayPlanNo;
	}
	public String getStayInfoNo() {
		return stayInfoNo;
	}
	public void setStayInfoNo(String stayInfoNo) {
		this.stayInfoNo = stayInfoNo;
	}
	public Time getStayPlanTime() {
		return stayPlanTime;
	}
	public void setStayPlanTime(Time stayPlanTime) {
		this.stayPlanTime = stayPlanTime;
	}
	public String getStayPlanMemo() {
		return stayPlanMemo;
	}
	public void setStayPlanMemo(String stayPlanMemo) {
		this.stayPlanMemo = stayPlanMemo;
	}
	

}
