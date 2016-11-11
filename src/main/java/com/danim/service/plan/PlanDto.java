package com.danim.service.plan;

public class PlanDto {
	private int planNo;
	private String memberId;
	private String planName;
	private int planHeadcount;
	private String planType;
	private String planDeparture;
	private String planArrival;
	private int planStay;
	private String planDate;
	private String planUpdate;
	private int planTotalMoney;
	private String planMemo;
	
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
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
	public String getPlanDeparture() {
		return planDeparture;
	}
	public void setPlanDeparture(String planDeparture) {
		this.planDeparture = planDeparture;
	}
	public String getPlanArrival() {
		return planArrival;
	}
	public void setPlanArrival(String planArrival) {
		this.planArrival = planArrival;
	}
	public int getPlanStay() {
		return planStay;
	}
	public void setPlanStay(int planStay) {
		this.planStay = planStay;
	}
	public String getPlanDate() {
		return planDate;
	}
	public void setPlanDate(String planDate) {
		this.planDate = planDate;
	}
	public String getPlanUpdate() {
		return planUpdate;
	}
	public void setPlanUpdate(String planUpdate) {
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
	
	@Override
	public String toString() {
		return "PlanDto [planNo=" + planNo + ", memberId=" + memberId + ", planName=" + planName + ", planHeadcount="
				+ planHeadcount + ", planType=" + planType + ", planDeparture=" + planDeparture + ", planArrival="
				+ planArrival + ", planStay=" + planStay + ", planDate=" + planDate + ", planUpdate=" + planUpdate
				+ ", planTotalMoney=" + planTotalMoney + ", planMemo=" + planMemo + "]";
	}
}