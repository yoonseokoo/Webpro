package com.lec.ex06_supermarket;

public class Person {

	private String name;
	private String tel;

	public Person(String name, String tel) {
		super();
		this.name = name;
		this.tel = tel;
	}

	public String infoString() {
		return "[name]: " + name + ", [tel]: " + tel;
	}

	protected String getName() {
		return name;
	}

	protected void setName(String name) {
		this.name = name;
	}

	protected String getTel() {
		return tel;
	}

	protected void setTel(String tel) {
		this.tel = tel;
	}
}