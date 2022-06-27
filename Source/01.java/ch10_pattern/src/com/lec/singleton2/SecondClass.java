package com.lec.singleton2;

public class SecondClass {
	public SecondClass() { // GOES TO SINGLETONCLASS
		SingletonClass singletonObject = SingletonClass.getInstance();
		System.out.println("Running secondClass contructor");
		System.out.println("Value of singleton object i: " + singletonObject.getI());

	}

}
