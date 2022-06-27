package com.lec.ex01_string;

public class Ex09_StringMemoryWaste {
	public static void main(String[] args) {
		String str1 = "Hello";
		String str2 = "Hello";
		System.out.println(str1 == str2 ? "same address" : "difference address");
		System.out.println("str1's hashcode : " + str1.hashCode());
		System.out.println("str2's hashcode : " + str2.hashCode());
		str1 = "Hello~";
		System.out.println("str1's hashcode(post change) : " + str1.hashCode());
		System.out.println(str1 == str2 ? "same address" : "different address");
		str1 = "Hello~~";
		System.out.println("str1's hashcode(post second change)  : " + str1.hashCode());
		str1 = "Hello~~~";
		System.out.println("str1's hashcode(post third change): " + str1.hashCode());
	}
}