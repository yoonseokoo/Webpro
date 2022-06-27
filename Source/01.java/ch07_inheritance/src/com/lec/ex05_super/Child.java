package com.lec.ex05_super;

public class Child extends Parent {
	int number = 2;
	String name = "Unie";

	public Child() {
	}

	public Child(String name) {
		super(name); // calls the parent constructor
		System.out.println("Child object");
	}

	@Override
	public void infoString() {
		int number = 1;
		String name = "Charlie";
		System.out.println(number); // 1
		System.out.println(this.number); // 2
		System.out.println(super.number); // 3

		System.out.println("Name is " + name); // Name is Charlie
		System.out.println("Name is " + this.name); // Name is Unie
		System.out.println("Name is " + super.name); // Name is Martha
	}

	// this. = in this class
	// this. = Refers to parent class objects
}
