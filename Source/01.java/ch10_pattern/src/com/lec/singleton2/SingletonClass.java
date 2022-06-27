
package com.lec.singleton2;

public class SingletonClass {
	private int i = 10;
	private static SingletonClass INSTANCE;

	public static SingletonClass getInstance() {
		if (INSTANCE == null) {
			INSTANCE = new SingletonClass(); // if INSTANCE IS NULL, i=10
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
