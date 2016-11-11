package com.danim.service.recommand;

public class RecommandDto {
	private String cityRankName;
	private int cityRankCount;
	
	public String getCityRankName() {
		return cityRankName;
	}
	public void setCityRankName(String cityRankName) {
		this.cityRankName = cityRankName;
	}
	public int getCityRankCount() {
		return cityRankCount;
	}
	public void setCityRankCount(int cityRankCount) {
		this.cityRankCount = cityRankCount;
	}
	
	@Override
	public String toString() {
		return "RecommandDto [cityRankName=" + cityRankName + ", cityRankCount=" + cityRankCount + "]";
	}
		
}
