package com.lec.ex06_wrapper;

public class Ex01_integer { // Wrapper classes recognizes primitive data types (int, boolean, etc..) as
					// objects.
	public static void main(String[] args) {
		int i = 10;
		int j = 10;
		int sum = i + j;
		System.out.println("Sum is " + sum);
		System.out.println(i == j ? "Two integers are the same" : "Two integers are different"); // comparing address
		Integer iObj = new Integer(10);
		Integer jObj = new Integer(10);
		sum = iObj.intValue() + jObj.intValue();
		System.out.println("Sum is " + sum);
		System.out
				.println(iObj.equals(jObj) ? "Two wrapper objects are the same" : "Two wrapper objects are different");
		System.out.println(iObj == jObj ? "Same address" : "Different address");
	}
}
