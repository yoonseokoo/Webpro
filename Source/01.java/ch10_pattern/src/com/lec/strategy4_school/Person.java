package com.lec.strategy4_school;

public abstract class Person {
	private Ijob job;
	private IGet get;
	private String id;
	private String name;
	public Person(String id, String name) {
		this.id = id;
		this.name = name;
	}

	public void positionJob() {
		job.job();

	}
	public void positionGet() {
		get.get();

	}
	public void print() {
	}

	public void setJob(Ijob job) {
		this.job = job;
	}

	public void setGet(IGet get) {
		this.get = get;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;

	}

}
