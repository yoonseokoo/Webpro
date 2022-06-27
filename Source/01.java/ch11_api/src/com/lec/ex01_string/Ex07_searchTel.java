package com.lec.ex01_string;

import java.util.Scanner;

public class Ex07_searchTel {
	public static void main(String[] args) {
		String[] tels = { "010-9999-9999", "02-8888-8888", "010-7777-8888" };
		Scanner sc = new Scanner(System.in);
		String searchTel;
		boolean searchOk = false;

		System.out.print("Last for digits of the number you want to find ?");
		searchTel = sc.next(); // last four digits the program will look for
		for (int idx = 0; idx < tels.length; idx++) {
			String post = tels[idx].substring(tels[idx].lastIndexOf('-') + 1);
			if (post.equals(searchTel)) {
				System.out.println("Number is " + tels[idx]);
				searchOk = true;
			}
		}
		if (!searchOk) {
			System.out.println("Number not in database");
		}
		sc.close();
	}
}