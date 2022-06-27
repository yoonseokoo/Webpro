package com.lec.singleton1;

public class SingletonClass {
	private int i;
	private static SingletonClass INSTANCE; // A static variable "INSTANCE" whose type is SingletonClass

	public static SingletonClass getInstance() { // getInstance method
		if (INSTANCE == null) {
			INSTANCE = new SingletonClass();
		}
		return INSTANCE;

	}

	private SingletonClass() {
	}

	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}

}
