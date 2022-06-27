package com.lec.practice;

import java.util.Scanner;

public class Ex01_practiceTimetable {
	public static void main(String[] args) {
		int num;
		int i;
		Scanner scanner = new Scanner(System.in);
		do {
			System.out.println("Enter an even number to print its timetables: ");
			num = scanner.nextInt();
		} while (num % 2 != 0);
		for (i = 1; i <= 10; i++) {
			System.out.println(num + " * " + i + " = " + i * num);
		}
		int mul = 1;
		int sum = 0;
		for (i = 1; i <= num; i++) {
			sum += i;
			mul *= i;
		}
		System.out.println("\nCumulative sum of all numbers between 1 and the number is: " + sum + "\n"
				+ "\nCumulative multiple of all numbers between 1 and the number is: " + mul);
		int sum2 = 0;
		for (i = 1; i <= num; i++) {
			if (i % 2 == 0) {
				sum2 += i;
			}
		}
		System.out.println("\nSum of even numbers from 0 to the number is: " + sum2);
	}
}
