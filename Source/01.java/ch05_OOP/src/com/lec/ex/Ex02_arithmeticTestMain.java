package com.lec.ex;

//Importing methods from a different class
public class Ex02_arithmeticTestMain {
	public static void main(String[] args) {
		int tot = Ex02_methodArithmetic.sum(10); // From class 'Arithmetic' use method 'sum'
		Ex02_methodArithmetic ar = new Ex02_methodArithmetic();
		System.out.println("-7's absolute value is " + ar.abs(-7));
		System.out.println("sum from 1~10 is " + tot);
		System.out.println(Ex02_methodArithmetic.evenOdd(tot));
	}
}
