package com.lec.ex;

public class Ex04_NullPointerException {
	public static void main(String[] args) {
		String greeting = "Hello";
		System.out.println(greeting.toUpperCase());
		greeting = null; // now greeting has no value to UPPER CASE
		System.out.println(greeting.toUpperCase());
	}
}