package com.lec.ex;

public class Ex04_casting {
	public static void main(String[] args) {
		int i1 = 10;
		double d2 = 10.19;

		double d1 = i1; // Widening Casting
		System.out.println("d1=" + d1);

		int i2 = (int) d2; // Narrowing Casting
		System.out.println("i2=" + i2);

	}
}