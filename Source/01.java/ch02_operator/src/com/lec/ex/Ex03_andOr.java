package com.lec.ex;

// > >= < <= == !=, AND (&&), OR(||)
public class Ex03_andOr {
	public static void main(String[] args) {
		int n1 = 10, n2 = 20;
		boolean result = ((n1 > n2) && (++n1 > n2)); // n1=11

		// If left is false, right is not even attempted
		System.out.println("result=" + result);

		// If left is true, right is not even attempted
		result = n1 < n2 || (++n1 > n2);
		System.out.println("result=" + result);

		result = n1 == n2;
		System.out.println("result=" + result);

	}
}
