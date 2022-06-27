package com.lec.ex06_wrapper;

public class Ex03_method {
	public static void main(String[] args) {
		System.out.println("Converting a String to a integer: Integer.parseInt(String)");
		int i = Integer.parseInt("10");
		System.out.println(i);
		System.out.println("Converting a integer to a String: String.valueOf(int)");
		String monthStr = String.valueOf(12);
		System.out.println(monthStr);
	}
}