package com.lec.dto;

import java.sql.Date;

public class MoneyDto {
	private int saleno;
	private int cusno;
	private int cost;
	private int amount;
	private int price;
	private String pcode;
	private Date sdate;
	private int totsales;
	public MoneyDto() {
	}
	public MoneyDto(int saleno, int cusno, int cost, int amount, int price, String pcode, Date sdate) {
		this.saleno = saleno;
		this.cusno = cusno;
		this.cost = cost;
		this.amount = amount;
		this.price = price;
		this.pcode = pcode;
		this.sdate = sdate;
	}
	public MoneyDto(String pcode, int totsales) {
		this.pcode = pcode;
		this.totsales = totsales;
	}
	public int getSaleno() {
		return saleno;
	}
	public void setSaleno(int saleno) {
		this.saleno = saleno;
	}
	public int getCusno() {
		return cusno;
	}
	public void setCusno(int cusno) {
		this.cusno = cusno;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	
	public int getTotsales() {
		return totsales;
	}
	public void setTotsales(int totsales) {
		this.totsales = totsales;
	}
	@Override
	public String toString() {
		return "MoneyDto [saleno=" + saleno + ", cusno=" + cusno + ", cost=" + cost + ", amount=" + amount + ", price="
				+ price + ", pcode=" + pcode + ", sdate=" + sdate + "]";
	}
	
	
	
}
