package com.danim.service.diary;

import java.util.List;

public class DayDto {
	 private int year;
	    private int month;
	    private int day;
	    private int week;
	    private List<CityRouteDto> cityRouteList;
	    
		public int getYear() {
			return year;
		}
		public void setYear(int year) {
			this.year = year;
		}
		public int getMonth() {
			return month;
		}
		public void setMonth(int month) {
			this.month = month;
		}
		public int getDay() {
			return day;
		}
		public void setDay(int day) {
			this.day = day;
		}
		public int getWeek() {
			return week;
		}
		public void setWeek(int week) {
			this.week = week;
		}
		public List<CityRouteDto> getCityRouteList() {
			return cityRouteList;
		}
		public void setCityRouteList(List<CityRouteDto> cityRouteList) {
			this.cityRouteList = cityRouteList;
		}
		@Override
		public String toString() {
			return "DayDto [year=" + year + ", month=" + month + ", day=" + day + ", week=" + week + ", cityRouteList="
					+ cityRouteList + "]";
		}
	
	    
}
