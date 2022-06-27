package com.lec.ex01_string;

import java.util.Scanner;

public class Ex04_juminNo {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Korean Jumin number ?");
		String juminNo = scanner.next();

// 		METHOD 1. (using 'charAt()' command)
//		char gender = juminNo.charAt(7);
//		if(gender=='1' || gender=='3') {
//			System.out.println("Male");
//		}else if(gender=='2' || gender=='4') {
//			System.out.println("Female");
//		}else {
//			System.out.println("Please check your number");
//		}

// 		METHOD 2. substring 결과를 숫자로 바꿔서 비료
//		int gender = Integer.parseInt(juminNo.substring(7, 8)); // parseInt parses a string and returns an integer
//		String msg = (gender==1 || gender==3)? "Male":
//							(gender==2||gender==4)? "Female":"Please check your number";

// 		METHOD 3.
		String gender = juminNo.substring(7, 8); //
		String msg = (gender.equals("1") || gender.equals("3")) ? "Male"
				: (gender.equals("2") || gender.equals("4")) ? "Female" : "Please check your number";
		System.out.printf("You are a %s", msg);

		scanner.close();

	}
}
