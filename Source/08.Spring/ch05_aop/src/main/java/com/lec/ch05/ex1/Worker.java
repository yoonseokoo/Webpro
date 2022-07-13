package com.lec.ch05.ex1;

import lombok.Data;

@Data
public class Worker {
	private String name;
	private int age;
	private String job;
	
	public void getWorkerInfo() { //CORE function to be called (target method = business logic) == joinPoint
		System.out.println("Name : " + name);
		System.out.println("Age : " + age);
		System.out.println("Job : " + job);
	}
}
