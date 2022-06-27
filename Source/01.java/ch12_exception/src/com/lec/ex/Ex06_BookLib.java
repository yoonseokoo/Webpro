package com.lec.ex;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class Ex06_BookLib implements Ex06_Ilendable {
	private String bookNo;
	private String bookTitle;
	private String writer;
	private String borrower;
	private Date checkOutDate;
	private byte state;

	public Ex06_BookLib(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}

	@Override
	public void checkOut(String borrower) throws Exception {
		if (state == STATE_BORROWED) {
			throw new Exception("The book " + bookTitle + "is currently borrowed"); // Exception when person wants to
																					// borrow a book that is already
																					// 'borrowed'
		}
		this.borrower = borrower;
		checkOutDate = new Date();
		state = STATE_BORROWED;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d(E)");
		System.out.println("\"The book " + bookTitle + " has been borrowed\"");
		System.out.println("Borrower = " + borrower + "\tDate of Borrow = " + sdf.format(checkOutDate)
				+ "\nPlease return by 2 weeks time");
	}

	@Override
	public void checkIn() throws Exception { // Exception when person wants to return something that has not been
												// checked as 'lent out'
		if (state == STATE_NORMAL) {
			throw new Exception("The book " + bookTitle + "is not currently borrowed"); // the message that will be
																						// printed when exception occurs
																						// (e.getMessage)
		}
		// ½Ã°£
		Date now = new Date();
		long diff = now.getTime() - checkOutDate.getTime();
		long day = diff / (1000 * 60 * 60 * 24);
		if (day > 14) {
			System.out.println("Penalty is 100won/day since the 14th day. Total penalty to be paid is "
					+ (day - 14) * 100 + "won)");
			Scanner scanner = new Scanner(System.in);
			System.out.println("Have you paid the penalty? (Y/N)");
			if (!scanner.next().equalsIgnoreCase("y")) {
				System.out.println("You must pay the penalty to return the book");
				return;
			}
		}
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
		System.out.println("The book " + bookTitle + " has been successfully returned. It is now available");
	}

	@Override
	public String toString() {
		String msg = "[Book No]: " + bookNo + "\t[Book Title]: + " + bookTitle + "\t[Author] : " + writer;
		msg += (state == STATE_NORMAL) ? "\t[State] = Available for borrow" : "\t[State]Currently borrowed";
		if (state == STATE_BORROWED) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d(E)");
			msg += sdf.format(checkOutDate);
		}
		return msg;
	}

	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
}