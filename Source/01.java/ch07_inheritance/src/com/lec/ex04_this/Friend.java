package com.lec.ex04_this;

//this.: my objective's something
//this() : Constructor function's Current class
public class Friend {
	private String name;
	private String tel;

	public Friend() {
		System.out.println("Constructor function without a parameter");
	}

	public Friend(String name) { // (1)
		this.name = name;
		System.out.println("Constructor function with one parameter");
	}

	public Friend(String name, String tel) {
		this(name); // goes to (1)
		this.tel = tel;
		System.out.println("Constructor function with two parameters");
	}

	public String infoString() {
		return "[name] : " + name + ", [tel] : " + tel + "\n";

	}
}
