package com.lec.ex02_date;

import java.util.GregorianCalendar;

public class Ex03_gc_term {
	public static void main(String[] args) {
		GregorianCalendar gcNow = new GregorianCalendar(); // Current date and time
		GregorianCalendar gcThat = new GregorianCalendar(2022, 2, 11, 9, 30); // Date and Time for first day of class
		long start = gcThat.getTimeInMillis(); // milliseconds between year 1970 ~ first day of class
		long end = gcNow.getTimeInMillis(); // // milliseconds between year 1970 ~ today
		int day = (int) (end - start) / (1000 * 60 * 60 * 24);
		System.out.println("How amny days passed since first day of class " + day);
	}
}
