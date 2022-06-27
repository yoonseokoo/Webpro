package com.lec.ex10_school;

public class Student extends Person {
	private String ban;
	static int count = 101;

	public Student(String id, String name, String ban) {
		super(id, name);
		this.ban = ban;

		setNo("st" + count);
		count++;
	}

	@Override
	public String infoString() {
		return super.infoString() + "\t(Class):" + ban;
	}
}
