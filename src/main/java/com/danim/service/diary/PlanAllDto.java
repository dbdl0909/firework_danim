package com.danim.service.diary;

import java.sql.Date;
import java.sql.Time;

public class PlanAllDto {
	private String planNo;
	private String cityRouteNo;
	private Date cityRouteDate;
	private String cityRouteDepartureCity;
	private String cityRouteArrivalCity;
	private Time cityRouteDepartureTime;
	private Time cityRouteArrivalTime;
	
	private String memberId;
	private String planName;
	private int planHeadcount;
	private String planType;
	private Date planDeparture;
	private Date planArrival;
	private int planStay;
	private Date planDate;
	private Date planUpdate;
	private int planTotalMoney;
	private String planMemo;

	private String landmarkPlanNo;
	private String landmarkInfoNo;
	private Time landmarkPlanTime;
	private String landmarkPlanMemo;

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
	public Date getPlanDeparture() {
		return planDeparture;
	}
	public void setPlanDeparture(Date planDeparture) {
		this.planDeparture = planDeparture;
	}
	public Date getPlanArrival() {
		return planArrival;
	}
	public void setPlanArrival(Date planArrival) {
		this.planArrival = planArrival;
	}
	public int getPlanStay() {
		return planStay;
	}
	public void setPlanStay(int planStay) {
		this.planStay = planStay;
	}
	public Date getPlanDate() {
		return planDate;
	}
	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}
	public Date getPlanUpdate() {
		return planUpdate;
	}
	public void setPlanUpdate(Date planUpdate) {
		this.planUpdate = planUpdate;
	}
	public int getPlanTotalMoney() {
		return planTotalMoney;
	}
	public void setPlanTotalMoney(int planTotalMoney) {
		this.planTotalMoney = planTotalMoney;
	}
	public String getPlanMemo() {
		return planMemo;
	}
	public void setPlanMemo(String planMemo) {
		this.planMemo = planMemo;
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
	public Time getLandmarkPlanTime() {
		return landmarkPlanTime;
	}
	public void setLandmarkPlanTime(Time landmarkPlanTime) {
		this.landmarkPlanTime = landmarkPlanTime;
	}
	public String getLandmarkPlanMemo() {
		return landmarkPlanMemo;
	}
	public void setLandmarkPlanMemo(String landmarkPlanMemo) {
		this.landmarkPlanMemo = landmarkPlanMemo;
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
	@Override
	public String toString() {
		return "PlanAllDto [planNo=" + planNo + ", cityRouteNo=" + cityRouteNo + ", cityRouteDate=" + cityRouteDate
				+ ", cityRouteDepartureCity=" + cityRouteDepartureCity + ", cityRouteArrivalCity="
				+ cityRouteArrivalCity + ", cityRouteDepartureTime=" + cityRouteDepartureTime
				+ ", cityRouteArrivalTime=" + cityRouteArrivalTime + ", memberId=" + memberId + ", planName=" + planName
				+ ", planHeadcount=" + planHeadcount + ", planType=" + planType + ", planDeparture=" + planDeparture
				+ ", planArrival=" + planArrival + ", planStay=" + planStay + ", planDate=" + planDate + ", planUpdate="
				+ planUpdate + ", planTotalMoney=" + planTotalMoney + ", planMemo=" + planMemo + ", landmarkPlanNo="
				+ landmarkPlanNo + ", landmarkInfoNo=" + landmarkInfoNo + ", landmarkPlanTime=" + landmarkPlanTime
				+ ", landmarkPlanMemo=" + landmarkPlanMemo + ", stayPlanNo=" + stayPlanNo + ", stayInfoNo=" + stayInfoNo
				+ ", stayPlanTime=" + stayPlanTime + ", stayPlanMemo=" + stayPlanMemo + "]";
	}
	
}
