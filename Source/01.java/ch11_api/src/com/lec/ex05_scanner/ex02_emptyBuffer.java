package com.lec.ex05_scanner;

import java.util.Scanner;

public class ex02_emptyBuffer {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		System.out.print("Address? ");
		String address = sc.nextLine(); // since the buffer is empty (no \n), this is possible
		System.out.println("Address is" + address);

		System.out.print("Name?");
		String name = sc.next();
		System.out.println("Name is " + name);
	}
}