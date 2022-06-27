package com.lec.ex05_super;

//Super. : My parent's
//Super() : My parent's Constructor function
public class Parent {
	int number = 3;
	String name = "Martha";

	public Parent() {
	}

	public Parent(String name) {
		this.name = name;
		System.out.println("Parent object");
	}

	public void infoString() {
		System.out.println("Name is " + name);

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}