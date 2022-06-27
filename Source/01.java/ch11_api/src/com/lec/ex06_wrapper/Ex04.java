package com.lec.ex06_wrapper;

import java.util.Scanner;

public class Ex04 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("Insert an integer");
		String numStr = sc.nextLine();
		System.out.println("String you have entered is " + numStr);
		numStr = numStr.trim(); // trimming space
		numStr = numStr.replaceAll("[a-zA-Z°¡-ÆR]", ""); // delete all sort of strings
		int num = Integer.parseInt(numStr);
		System.out.println("converted integer is " + num);
	}
}
