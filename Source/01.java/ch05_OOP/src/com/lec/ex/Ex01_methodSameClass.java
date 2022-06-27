package com.lec.ex;

//Using methods in the same class
public class Ex01_methodSameClass {
	public static void main(String[] args) {
		int tot = sum(9); // method 1
		System.out.println("culumlative sum of numbers 1~10 is " + tot);
		System.out.println(evenOdd(tot)); // method 3

		tot = sum(10, 100); // method 2
		System.out.println("culumlative sum of numbers 10~100 is " + tot);
		System.out.println(evenOdd(tot)); // method 3
	}

	private static int sum(int to) { // METHOD 1: SUM (with one parameter)
		int result = 0;
		for (int i = 1; i <= to; i++) {
			result += i;
		}
		return result;
	}

	private static int sum(int from, int to) { // METHOD 2: SUM(with two parameters)
		int result = 0;
		for (int i = from; i <= to; i++) {
			result += i;
		}
		return result;
	}

	private static String evenOdd(int value) { // METHOD 3: SUM Defining even/odd
		return value % 2 == 0 ? "Even" : "Odd";
	}
}
