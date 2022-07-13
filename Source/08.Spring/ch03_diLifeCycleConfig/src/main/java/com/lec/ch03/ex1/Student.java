package com.lec.ch03.ex1;

import java.util.ArrayList;

import lombok.Data;
@Data
public class Student {
	private String name;
	private int age;
	private ArrayList<String> Hobby;
	private double height;
	private double weight;
	
	public Student(String name, int age, ArrayList<String> hobby) {
		super();
		this.name = name;
		this.age = age;
		Hobby = hobby;
	}
	
	
}
