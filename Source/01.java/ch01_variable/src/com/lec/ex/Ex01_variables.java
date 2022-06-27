package com.lec.ex;

// 변수 선언 방법들
public class Ex01_variables {
	public static void main(String[] args) {

		// (1)
		int num1; // Variable declaration
		num1 = 10; // Variable initialization
		System.out.println("num1=" + num1);

		// (2)
		int num2 = 20; // Simultaneously declaring and initializing variable

		// (3)
		int num3, num4; // Multiple declarations
		num3 = 30;
		num4 = 40;
		System.out.printf("num3=%d, num4=%d\n", num3, num4);

		// (4)
		int num5 = 50, num6 = 60, num7; // Simultaneously declaring and initializing multiple variables
		num7 = 70;

	}
}