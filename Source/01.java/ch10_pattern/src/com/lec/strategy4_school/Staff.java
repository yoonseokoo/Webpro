package com.lec.strategy4_school;

public class Staff extends Person {
	public String belong;
	public Staff(String id, String name, String belong) {
		super(id, name);
		this.belong = belong;
		System.out.println("[ID] : " + getId() + "\t[NAME] : " + getName()
				+ "\t[Belong] : " + belong);
		setJob(new JobMng());
		setGet(new GetSalary());

	}
	@Override
	public void print() {
		System.out.println("[ID] : " + getId() + "\t[NAME] : " + getName()
				+ "\t[Belong] : " + belong);

	}

}
