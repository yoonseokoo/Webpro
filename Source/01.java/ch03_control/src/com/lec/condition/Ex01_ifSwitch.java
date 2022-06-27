package com.lec.condition;

import java.util.Scanner;

public class Ex01_ifSwitch {
	public static void main(String[] args) {
		int num1, num2;
		int i = 10;
		Scanner sc = new Scanner(System.in);
		System.out.print("Pick number from 1~5");
		num1 = sc.nextInt();

		switch (num1) { // only 정수형, 문자형, 문자열
		case 1:
			System.out.println("num1 is 1");
			break;
		case 2:
			System.out.println("num1 is 2");
			break;
		case 3:
			System.out.println("num1 is 3");
			break;
		case 4:
			System.out.println("num1 is 4");
			break;
		case 5:
			System.out.println("num1 is 5");
			break;
		}

		System.out.print("Pick number from 1~5");
		num2 = sc.nextInt();

		switch (num2) { // only 정수형, 문자형, 문자열
		case 1:
			System.out.println("num2 is 1");
			break;
		case 2:
			System.out.println("num2 is 2");
			break;
		case 3:
			System.out.println("num3 is 3");
			break;
		case 4:
			System.out.println("num4 is 4");
			break;
		case 5:
			System.out.println("num5 is 5");
			break;

		default:
			System.out.println("It's another number");
		}

		if (num1 > num2) {
			System.out.println("The num1 is " + (num1 - num2) + " bigger than num2");
		} else if (num1 < num2) {
			System.out.printf("The num2 is \"%d\" bigger than num1\n", num2 - num1);
		} else {
			System.out.println("The two numbers are equal");
		}

		sc.close();
	}
}
