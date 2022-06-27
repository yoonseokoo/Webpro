package com.lec.ex01_string;

import java.util.Scanner;

public class Ex03_DoWhileEqual {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String fn;
		do {
			System.out.println("I : input | U: Update | X : exit");
			fn = scanner.next();
			switch (fn) {
			case "i":
			case "I":
				System.out.println("Input logic goes here");
				break;
			case "u":
			case "U":
				System.out.println("Update logic goes here");
			}

		} while ((!fn.equalsIgnoreCase("x"))); // does not matter whether user inputs 'x' or 'X'
		System.out.println("DONE");

	}
}