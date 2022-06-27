package com.lec.ex;

//Ternary operator : (condition) ? (output if true) : (output if false)
public class Ex04_ternaryOperator {
	public static void main(String[] args) {
		int i = 100;
		String evenOdd = (i % 2 == 0) ? "Even" : "Odd";
		System.out.println(evenOdd);

		String multipleOf3 = (i % 3 == 0) ? "Number is a multiple of 3" : "Number not a multiple of 3";
		System.out.println(multipleOf3);

	}
}
