package com.lec.ex10_school;

public class Employee extends Person {
	private String department;
	static int count = 1;

	public Employee(String id, String name, String department) {
		super(id, name);
		this.department = department;
		setNo("empl" + count);
		++count;
	}

	@Override
	public String infoString() {
		return super.infoString() + "\t(Department): " + department;
	}
}
