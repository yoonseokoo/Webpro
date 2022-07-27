package com.lec.dto;

import java.sql.Date;

public class GradeDto {
	private char grade;
	private String gdesc;
	public GradeDto() {
	}
	public GradeDto(char grade, String gdesc) {
		this.grade = grade;
		this.gdesc = gdesc;
	}
	public char getGrade() {
		return grade;
	}
	public void setGrade(char grade) {
		this.grade = grade;
	}
	public String getGdesc() {
		return gdesc;
	}
	public void setGdesc(String gdesc) {
		this.gdesc = gdesc;
	}
	@Override
	public String toString() {
		return "GradeDto [grade=" + grade + ", gdesc=" + gdesc + "]";
	}
	
	

}