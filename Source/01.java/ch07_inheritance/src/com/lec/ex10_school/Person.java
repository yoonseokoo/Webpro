package com.lec.ex10_school;

public class Person {

	private String no;
	private String id;
	private String name;

	public Person(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public String infoString() {
		return "(Number): " + no + "\t\t(ID): " + id + "\t(Name): " + name;
	}

	protected String getNo() {
		return no + "\t";
	}

	protected void setNo(String no) {
		this.no = no;
	}

	protected String getId() {
		return id;
	}

	protected void setId(String id) {
		this.id = id;
	}

	protected String getName() {
		return name;
	}

	protected void setName(String name) {
		this.name = name;
	}

}
