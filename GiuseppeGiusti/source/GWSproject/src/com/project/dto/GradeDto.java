package com.project.dto;

public class GradeDto {
	private int mGrade;
	private String gName;
	private int lowGrade;
	private int highGrade;
	
	public GradeDto() {
	}
	public GradeDto(int mGrade, String gName, int lowGrade, int highGrade) {
		this.mGrade = mGrade;
		this.gName = gName;
		this.lowGrade = lowGrade;
		this.highGrade = highGrade;
	}
	public int getmGrade() {
		return mGrade;
	}
	public void setmGrade(int mGrade) {
		this.mGrade = mGrade;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public int getLowGrade() {
		return lowGrade;
	}
	public void setLowGrade(int lowGrade) {
		this.lowGrade = lowGrade;
	}
	public int getHighGrade() {
		return highGrade;
	}
	public void setHighGrade(int highGrade) {
		this.highGrade = highGrade;
	}
	@Override
	public String toString() {
		return "GradeDto [mGrade=" + mGrade + ", gName=" + gName + ", lowGrade=" + lowGrade + ", highGrade=" + highGrade
				+ "]";
	}
}
