package com.lec.quiz;

public class Person {
	private String name;
	private String tel;
	private int age;

	public Person(String name, String tel, int age) {
		super();
		this.name = name;
		this.tel = tel;
		this.age = age;
	}
	@Override
	public String toString() {
		return "Person [NAME]= " + name + "\t[TEL]= " + tel + "\t[AGE]= " + age
				+ "\n";
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setAge(int age) {
		this.age = age;
	}
}
