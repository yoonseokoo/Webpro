package com.lec.strategy4_school;

public class Student extends Person {
	public String belong;

	public Student(String id, String name, String belong) {
		super(id, name);
		this.belong = belong;
		System.out.println("[ID] : " + getId() + "\t[NAME] : " + getName()
				+ "\t[Belong] : " + belong);
		setJob(new JobStudy());
		setGet(new GetStudentPay());

	}

	@Override
	public void print() {
		System.out.println("[ID] : " + getId() + "\t[NAME] : " + getName()
				+ "\t[Belong] : " + belong);

	}

}