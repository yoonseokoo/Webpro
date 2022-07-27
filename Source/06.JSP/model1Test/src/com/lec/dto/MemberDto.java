package com.lec.dto;

import java.sql.Date;

public class MemberDto {
	private int cusno;
	private String custname;
	private String phone;
	private String address;
	private Date joindate;
	private String grade;
	private String city;
	private String gdesc;
	private int tot;
	
	public MemberDto() {
	}

	public MemberDto(int cusno, String custname, String phone, String address, Date joindate, String grade, String city) {
		super();
		this.cusno = cusno;
		this.custname = custname;
		this.phone = phone;
		this.address = address;
		this.joindate = joindate;
		this.grade = grade;
		this.city = city;
	}

	public MemberDto(int cusno, String custname, String gdesc, int tot) {
		this.cusno = cusno;
		this.custname = custname;
		this.gdesc = gdesc;
		this.tot = tot;
	}

	public int getCusno() {
		return cusno;
	}

	public void setCusno(int cusno) {
		this.cusno = cusno;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGdesc() {
		return gdesc;
	}

	public void setGdesc(String gdesc) {
		this.gdesc = gdesc;
	}

	public int getTot() {
		return tot;
	}

	public void setTot(int tot) {
		this.tot = tot;
	}

	@Override
	public String toString() {
		return "MemberDto [cusno=" + cusno + ", custname=" + custname + ", phone=" + phone + ", address=" + address
				+ ", joindate=" + joindate + ", grade=" + grade + ", city=" + city + "]";
	}
	
	
}
