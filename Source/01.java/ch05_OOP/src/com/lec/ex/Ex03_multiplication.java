package com.lec.ex;

import java.util.Scanner;

public class Ex03_multiplication {

	public static void main(String[] args) {
		int su;
		Scanner scanner = new Scanner(System.in);
		
		do {
			System.out.println("PICK A NUMBER: ");
			su = scanner.nextInt();
		} while (su < 2 ||su >= 10);
		
		multiplication(su);
	}
		private static void multiplication(int su) {

				for(int i=1 ; i<10 ; i++) {
				System.out.println(su + "*" + i + " = " + su*i);
				}
		}

}

