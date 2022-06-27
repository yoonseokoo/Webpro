package com.lec.ex;

public class Ex02_addSubtract {
	public static void main(String[] args) {
		int n1 = 10;

		System.out.println("Subtractions");
		int n2 = n1--; // -- behind n1: n1 decreases by 1, n2 adopts n1's value before change
		System.out.println("n1: " + n1);// 9
		System.out.println("n2: " + n2);// 10
		n2 = --n1; // -- in front of n1: both n1 & n2 decreases by 1
		System.out.println("n1: " + n1);// 8
		System.out.println("n2: " + n2);// 8

		System.out.println("\nAdditions");
		n2 = ++n1; // ++ in front of n1: both n1 & n2 increases by 1
		System.out.println("n1: " + n1);// 9
		System.out.println("n2: " + n2);// 9
		n2 = n1++; // ++ behind n1: n1 increases by 1, n2 adopts n1's value before change
		System.out.println("n1: " + n1);// 10
		System.out.println("n2: " + n2);// 9

	}
}