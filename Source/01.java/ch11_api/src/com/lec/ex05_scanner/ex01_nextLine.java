package com.lec.ex05_scanner;

import java.util.Scanner;

public class ex01_nextLine {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Age : ?");
		int age = scanner.nextInt();
		System.out.println("Age you have entered is " + age);

		System.out.print("Name ?");
		String name = scanner.next();
		System.out.println("You name is " + name);
		nickName();
		System.out.print("Address?");
		scanner.nextLine(); // all the previous "\n" is deleted
		String address = scanner.nextLine();// only the value after the "\n" (the address is printed
		System.out.println("Address is " + address);
		scanner.close();
	}

	private static void nickName() { // Method that asks user its nickname
		Scanner scNickName = new Scanner(System.in);
		System.out.print("Nickname ?");
		System.out.println("Age " + scNickName.nextLine());
	}
}
