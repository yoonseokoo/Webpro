package com.lec.ex10_school;

public class Gangsa extends Person {
	private String subject;
	static int count = 1;

	public Gangsa(String id, String name, String subject) {
		super(id, name);
		this.subject = subject;
		setNo("lec" + count);
		count++;
	}

	@Override
	public String infoString() {
		return super.infoString() + "\t(Subject): " + subject;
	}
}
