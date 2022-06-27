package com.lec.ex06_wrapper;

public class Ex02_double {
	public static void main(String[] args) {
		double i = 10.1;
		double j = 10.1;
		double sum = i + j;
		System.out.println("гую╨ " + sum);
		System.out.println(i == j ? "Two integers are the same" : "Two integers are different"); // comparing address
		Double iObj = 10.1;
		Double jObj = new Double(10.1);
		sum = iObj + jObj; // sum = iObj.intValue() + jObj.intValue();
		System.out.println("sum is " + sum);
		System.out
				.println(iObj.equals(jObj) ? "Two wrapper objects are the same" : "Two wrapper objects are different");
		System.out.println(iObj == jObj ? "Same address" : "Different address");
	}
}