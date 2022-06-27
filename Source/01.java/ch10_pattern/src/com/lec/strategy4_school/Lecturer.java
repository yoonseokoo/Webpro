package com.lec.strategy4_school;

public class Lecturer extends Person {
	public String belong;
	public Lecturer(String id, String name, String belong) {
		super(id, name);
		this.belong = belong;
		System.out.println("[ID] : " + getId() + "\t[NAME] : " + getName()
				+ "\t[Belong] : " + belong);
		setJob(new JobLec());
		setGet(new GetSalary());

	}

	public void print() {
		System.out.println("[ID] : " + getId() + "\t[NAME] : " + getName()
				+ "\t[Belong] : " + belong);
	}
}