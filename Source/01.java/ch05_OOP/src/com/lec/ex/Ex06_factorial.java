package com.lec.ex;

import java.util.Scanner;

public class Ex06_factorial {
	public static void main(String[] args) {
		int su;
		Scanner scanner = new Scanner(System.in);

		do {
			System.out.print("Enter a positive integer : ");
			su = scanner.nextInt();
		} while (su <= 0);

		long result = factorial(su); // METHOD 1
		System.out.println("The entered " + su + "! = " + result);
		System.out.printf("The entered %d!= %d", su, result);
	}

	private static long factorial(int su) { // METHOD 1
		if (su == 1) {
			return 1;
		} else {
			return su * factorial(su - 1);
		}
	}

}
