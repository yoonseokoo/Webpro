package com.lec.ex01_string;

public class Ex11_speedCheck {
	public static void main(String[] args) {
		System.out.println(System.currentTimeMillis());

		// Checking time
		String str = "A";
		long startTime = System.currentTimeMillis(); // milliseconds from 1 jan 1970 till now
		for (int i = 0; i < 100000; i++) { // change 100000 times
			str = str + "a";
		}
		long endTime = System.currentTimeMillis();// milliseconds from 1 jan 1970 till logic has completely run
		System.out.println("Time taken for String to change 100000 times: " + (endTime - startTime)); // milliseconds
																										// taken to run
																										// logic

		// StringBuffer Checking time
		StringBuffer strBuf = new StringBuffer("A");
		startTime = System.currentTimeMillis();
		for (int i = 0; i < 100000; i++) {
			strBuf.append("a");
		}
		endTime = System.currentTimeMillis();
		System.out.println("Time taken for StringBuffer to change 100000 times: " + (endTime - startTime)); // milliseconds
																											// taken to
																											// run logic
		// for stringBuffer

		// StringBuilder Checking time
		StringBuilder strBuld = new StringBuilder("A");
		startTime = System.currentTimeMillis();
		for (int i = 0; i < 100000; i++) {
			strBuld.append("a");
		}
		endTime = System.currentTimeMillis();
		System.out.println("Time taken for StringBuilder to change 100000 times: " + (endTime - startTime));// milliseconds
																											// taken to
																											// run logic
		// for stringBuilder
	}
}