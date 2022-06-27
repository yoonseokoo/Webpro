package com.lec.ex;

import java.util.Date;

public class Ex06_TestMain {
	public static void main(String[] args) {
		Ex06_BookLib book1 = new Ex06_BookLib("123456abc", "1984", "George Orwell");
		Ex06_BookLib book2 = new Ex06_BookLib("234567abc", "Pride_and_Prejudice", "Austin");
		System.out.println(book1);
		try {
			book1.checkOut("John Steinbeck");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		book1.setCheckOutDate(new Date(122, 2, 11)); // 3¿ù11ÀÏ¿¡ ´ëÃâÇÔÀ¸·Î ¼öÁ¤
		System.out.println(book1);
		try {
			book1.checkIn();
		} catch (Exception e) {
			System.out.println("Exception message: " + e.getMessage());
		}
		System.out.println(book1);
	}
}