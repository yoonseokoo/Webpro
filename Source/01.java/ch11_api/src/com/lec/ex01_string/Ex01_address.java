package com.lec.ex01_string;

public class Ex01_address {
	public static void main(String[] args) {
		String str1 = "Java";
		String str2 = "Java";
		String str3 = new String("Java"); // CREATING A NEW OBJECT

		System.out.println(
				str1 == str2 ? "str1 and str2 have the same address" : "str1 and str2 have different addresses");
		System.out.println(str1.equals(str2) ? "Same string" : "different strings"); // COMPARING THE VALUE OF EACH
		System.out.println(
				str1 == str3 ? "str1 and str3 have the same address" : "str1 and str3 have different addresses");
		System.out.println(str1.equals(str3) ? "Same string" : "different strings"); // COMPARING THE VALUE OF EACH
																						// VARIABLE
	}
}
