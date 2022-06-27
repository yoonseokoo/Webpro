package com.lec.ex2_datastreaming;

public class Member {
	private String name;
	private int age;
	private String nationality;

	public Member(String name, int age, String nationality) {
		super();
		this.name = name;
		this.age = age;
		this.nationality = nationality;
	}

	@Override
	public String toString() {
		return "Member [name=" + name + ", age=" + age + ", nationality=" + nationality + "]";
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

}
