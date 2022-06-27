package com.lec.ex;

//TO USE THE BEAN TAG, MUST CREATE AN EMPTY CONSTRUCTOR, SETTER, GETTER
public class Person {
	private String Name;
	private int age;
	private char gender;
	private String address;

	public Person() {
	}

	public Person(String name, int age, char gender, String address) {
		super();
		Name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
