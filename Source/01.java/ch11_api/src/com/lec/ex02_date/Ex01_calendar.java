package com.lec.ex02_date;

import java.util.Calendar;

public class Ex01_calendar {
	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance();
		System.out.println(cal);
		System.out.println(Calendar.getInstance());
		int year = cal.get(Calendar.YEAR);
		System.out.println(year);
		System.out.printf("%tY", cal);
		int month = cal.get(Calendar.MONTH) + 1; // 0:Jan, 1:Feb...
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int week = cal.get(Calendar.DAY_OF_WEEK); // 1: Sunday, 2: Monday...
		int hour24 = cal.get(Calendar.HOUR_OF_DAY);
		int ampm = cal.get(Calendar.AM_PM); // 0(AM) 1(PM)
		int hour = cal.get(Calendar.HOUR);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		int millisec = cal.get(Calendar.MILLISECOND);
		System.out.printf("%d�� %d�� %d��", year, month, day);
		switch (week) {
		case 1:
			System.out.print("SUNDAY");
			break;
		case 2:
			System.out.print("MONDAY");
			break;
		case 3:
			System.out.print("TUESDAY");
			break;
		case 4:
			System.out.print("WEDNESDAY");
			break;
		case 5:
			System.out.print("THURSDAY");
			break;
		case 6:
			System.out.print("FRIDAY");
			break;
		case 7:
			System.out.print("SATURDAY");
			break;
		}
		System.out.print(ampm == 0 ? "AM" : "PM");
		System.out.printf("%d�� %d�� %d�� %d\n", hour, minute, second, millisec);
		System.out.printf("%d�� %d�� %d�� %d\n", hour24, minute, second, millisec);

		// ONLY WHEN USING PRINTF:
		System.out.printf("%tY�� %tm�� %td�� %ta���� %tp %tl�� %tM�� %tS��\n", cal, cal, cal, cal, cal, cal, cal, cal);
		System.out.printf("%1$tY�� %1$tm�� %1$td�� %1$ta���� %1$tp %1$tl�� %1$tM�� %1$tS��", cal);
	}
}