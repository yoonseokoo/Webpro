package com.lec.singleton2;

public class FirstClass {
	public FirstClass() { // GOES TO SINGLETONCLASS
		SingletonClass singletonObject = SingletonClass.getInstance();
		System.out.println("Value of singleton object i: " + singletonObject.getI()); // 10
		singletonObject.setI(999);
		System.out.println("After singleton class sets a new i value, i: " + singletonObject.getI());
	}
}