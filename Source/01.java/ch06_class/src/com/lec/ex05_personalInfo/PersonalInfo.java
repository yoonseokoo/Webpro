package com.lec.ex05_personalInfo;
public class PersonalInfo {
	private String name;
	private int age;
	private String gender;
	
	public PersonalInfo () {} //CONSTRUCTOR
	
	public PersonalInfo (String name, int age, String gender) { //CONSTRUCTOR WITH 3 PARAMETERS
		this.name = name;
		this.age = age;
		this.gender = gender;
	}
	public void printinfo() { //METHOD
		System.out.println("Name = " + name + ", Age= " + age + ", Gender= " + gender);
	}
	
	//GETTERS & SETTERS
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
}
