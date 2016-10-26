package com.danim.service.diary;

import java.sql.Date;
import java.sql.Time;

public class CityRouteDto {
	private String cityRouteNo;
	private String planNo;
	private Date cityRouteDate;
	private String cityRouteDepartureCity;
	private String cityRouteArrivalCity;
	private Time cityRouteDepartureTime;
	private Time cityRouteArrivalTime;
	
	private String repeat;
    private String srcScheduleDate;
    
	
	public String getRepeat() {
		return repeat;
	}
	public void setRepeat(String repeat) {
		this.repeat = repeat;
	}
	public String getSrcScheduleDate() {
		return srcScheduleDate;
	}
	public void setSrcScheduleDate(String srcScheduleDate) {
		this.srcScheduleDate = srcScheduleDate;
	}
	public String getCityRouteNo() {
		return cityRouteNo;
	}
	
	
	public void setCityRouteNo(String cityRouteNo) {
		this.cityRouteNo = cityRouteNo;
	}
	public String getPlanNo() {
		return planNo;
	}
	public void setPlanNo(String planNo) {
		this.planNo = planNo;
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
	@Override
	public String toString() {
		return "CityRouteDto [cityRouteNo=" + cityRouteNo + ", planNo=" + planNo + ", cityRouteDate=" + cityRouteDate
				+ ", cityRouteDepartureCity=" + cityRouteDepartureCity + ", cityRouteArrivalCity="
				+ cityRouteArrivalCity + ", cityRouteDepartureTime=" + cityRouteDepartureTime
				+ ", cityRouteArrivalTime=" + cityRouteArrivalTime + "]";
	}

	
	
}
