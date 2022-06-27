package com.lec.ex;

public class Ex03_floatDouble {
	public static void main(String[] args) {
		float f1, f2;
		f1 = 10.1F;
		System.out.println("f1=" + f1);

		f1 = 10.0000017F; // Rounds up to 6dp by default
		double d = 10.0000017; // Does not round to 6dp
		System.out.println("f1=" + f1); // f1=10.000002
		System.out.println("d=" + d);

		f1 = 10.1f;
		d = 10.1;
		System.out.println("Two variables are equal");
		if (f1 == d)
			System.out.println("Two variables are equal");
		else
			System.out.println("Two variables are different");
	}

}
