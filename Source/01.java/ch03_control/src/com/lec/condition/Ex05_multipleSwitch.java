package com.lec.condition;

import java.util.Scanner;

public class Ex05_multipleSwitch {
	public static void main(String [] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("What month is it?: ");
		int month = scanner.nextInt();
				switch (month) {
				case 12: case 1: case 2:
					System.out.println("It is winter"); break;
				case 3: case 4: case 5:
					System.out.println("It is Spring"); break;
				case 6: case 7: case 8:
					System.out.println("It is Summer"); break;
				case 9: case 10: case 11:
					System.out.println("It is Winter"); break;
				default:
					System.out.println("n/a");
								}
											}
					}
