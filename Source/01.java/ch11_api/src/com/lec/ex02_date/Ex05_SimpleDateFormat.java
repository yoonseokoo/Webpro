package com.lec.ex02_date;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Ex05_SimpleDateFormat {
	public static void main(String[] args) {
		Date now1 = new Date();
		Calendar now2 = Calendar.getInstance();
		GregorianCalendar now3 = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 a hh시 mm분 ss초");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd (E) , a hh:mm:ss");

		System.out.println(sdf2.format(now1));
		System.out.println(sdf2.format(now2.getTime()));
		System.out.println(sdf2.format(now3.getTime()));
	}
}
