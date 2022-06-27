package com.lec.ex01_string;

import java.util.Scanner;

public class Ex06_telPrint {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		while (true) {
			System.out.print("Please enter your number (010-9898-1234 format)\n press (x) to exit");
			String tel = sc.next();
			if (tel.equalsIgnoreCase("x"))
				break;

			System.out.println("You number : " + tel);
			System.out.print("Number's at odd places : ");
			for (int i = 0; i < tel.length(); i++) {
				if (i % 2 == 0) {
					System.out.print(tel.charAt(i));
				} else {
					System.out.print(' '); // For numbers at even places print empty space
				}
			}
			System.out.print("\nNumber upside down :");
			for (int i = tel.length() - 1; i >= 0; i--) {
				System.out.print(tel.charAt(i));
			}
//			System.out.println();
			System.out.println("\nFront digits : " + tel.substring(0, tel.indexOf('-'))); // first indexOf '-' = 3,
																							// subString(3) = 010
			System.out.println("Last digits : " + tel.substring(tel.lastIndexOf('-') + 1)); // lastIndexOf '-' = 8,
																							// subString(9) = 010
			System.out.println("Middle digits: " + tel.substring(tel.indexOf('-') + 1, tel.lastIndexOf('-'))); // subString
																												// between
																												// 4
																												// and 8
		}
	}
}
