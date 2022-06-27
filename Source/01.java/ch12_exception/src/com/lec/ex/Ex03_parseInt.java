package com.lec.ex;

public class Ex03_parseInt {
	public static void main(String[] args) {
		int i = Integer.parseInt(""); // EMPTY STRINGS CANNOT CONVERT TO A INTEGER
		System.out.println(i);
		int j = Integer.parseInt("100 "); // STRINGS WITH SPACES CANNOT CONVERT TO A INTEGER
		System.out.println(j);
	}
}