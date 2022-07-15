package com.lec.ch05.ex2;

import lombok.Data;

@Data
public class Student2 {
	private String name;
	private int age;
	private int gradeNum;
	private int classNum;
	
	public void getStudentInfo() { //CORE function to be called (target method = business logic)
		System.out.println("Name : " + name);
		System.out.println("Age : " + age);
		System.out.println("Grade  : " + gradeNum);
		System.out.println("Class Number : " + classNum);
	}
}
