package com.danim.service.plan;

import java.util.ArrayList;

public class CityRouteDto {
	private int cityRouteNo;
	private int planNo;
	private String cityRouteDate;
	private String cityRouteDepartureCity;
	private String cityRouteArrivalCity;
	private String cityRouteDepartureTime;
	private String cityRouteArrivalTime;
	private String cityRouteMemo;
	
	public int getCityRouteNo() {
		return cityRouteNo;
	}
	public void setCityRouteNo(int cityRouteNo) {
		this.cityRouteNo = cityRouteNo;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public String getCityRouteDate() {
		return cityRouteDate;
	}
	public void setCityRouteDate(String cityRouteDate) {
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
	public String getCityRouteMemo() {
		return cityRouteMemo;
	}
	public void setCityRouteMemo(String cityRouteMemo) {
		this.cityRouteMemo = cityRouteMemo;
	}
	
	@Override
	public String toString() {
		return "CityRouteDto [cityRouteNo=" + cityRouteNo + ", planNo=" + planNo + ", cityRouteDate=" + cityRouteDate
				+ ", cityRouteDepartureCity=" + cityRouteDepartureCity + ", cityRouteArrivalCity="
				+ cityRouteArrivalCity + ", cityRouteDepartureTime=" + cityRouteDepartureTime
				+ ", cityRouteArrivalTime=" + cityRouteArrivalTime + ", cityRouteMemo=" + cityRouteMemo + "]";
	}
}