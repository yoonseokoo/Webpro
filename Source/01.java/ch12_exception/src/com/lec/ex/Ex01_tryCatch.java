package com.lec.ex;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Ex01_tryCatch {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int i = 0;
		int j = 0;
		do {
			try {
				System.out.print("Pick an integer: ");
				i = scanner.nextInt();
				break;
			} catch (InputMismatchException e) {
				System.out.println("You must enter an INTEGER. Hence i = " + e.getMessage());
				scanner.nextLine(); // CLEARING BUFFER
			}
		} while (true);
		do {
			try {
				System.out.print("Pick second integer: ");
				j = scanner.nextInt();
				break;
			} catch (InputMismatchException e) {
				System.out.println("You must enter an INTEGER. Hence j = " + e.getMessage());
				scanner.nextLine();
			}
		} while (true);

		System.out.println("i = " + i + ", j = " + j);
		System.out.println("i * j = " + (i * j));
		try {
			System.out.println("i / j = " + (i / j)); // SINCE DIVISION CAN CAUSE AN ERROR IN CASE j = 0
		} catch (ArithmeticException e) {
			System.out.println("Division cannot be proceeeded because we cannot " + e.getMessage());
			// e.printStackTrace(); DETAILED EXPLAINATION ON SOURCE OF ERROR
		} catch (Exception e) {
			System.out.println(e.getMessage()); // REPRESENTS ALL EXCEPTIONS
		}
		System.out.println("i + j = " + (i + j));
		System.out.println("i - j = " + (i - j));
		scanner.close();
	}
}