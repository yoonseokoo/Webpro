package com.lec.ex06_supermarket;

public class Staff extends Person {
	private String hiredate;
	private String department;

	public Staff(String name, String tel, String hiredate, String department) {
		super(name, tel);
		this.hiredate = hiredate;
		this.department = department;
	}

	@Override
	public String infoString() {
		return super.infoString() + " [Hiredate]: " + hiredate + " [Department]: " + department;

	}
}
