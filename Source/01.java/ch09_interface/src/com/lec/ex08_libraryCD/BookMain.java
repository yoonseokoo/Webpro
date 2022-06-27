package com.lec.ex08_libraryCD;

import java.util.Scanner;

public class BookMain {
	public static void main(String[] args) {
		BookLib[] books = {new BookLib("123456abc", "1984", "George Orwell"),
				new BookLib("234567abc", "Pride_and_Prejudice", "Austin"),
				new BookLib("345678abc", "The_Great_Gatsby",
						"Scott Fitzgerald"),
				new BookLib("456789abc", "Lord_of_the_Rings", "J.R.R Tolkien"),
				new BookLib("567890abc", "Romeo_and_Julliet", "Shakespeare")};
		Scanner scanner = new Scanner(System.in);
		int fn;
		int idx;
		String btitle, borrower, checkOutDate;

		do {
			System.out.println("1: Borrow | 2: Return | 3: BookList | 0: end");
			System.out.println("Enter the action you want to take: ");
			fn = scanner.nextInt();
			switch (fn) {

				case 1 :
					System.out.println("What book would you like to borrow?\n"
							+ "Insert book name: ");
					btitle = scanner.next();
					for (idx = 0; idx < books.length; idx++) {
						if (btitle.equals(books[idx].getBookTitle())) {
							break;
						}
					}
					if (idx == books.length) {
						System.out.println(
								"Our library is currently not hold of this book");
					} else {
						if (books[idx].getState() == BookLib.STATE_BORROWED) {
							System.out.println("This book is already borrowed");
						} else {
							System.out.println("Enter your name: ");
							borrower = scanner.next();
							System.out
									.println("Insert the date of borrowing: ");
							checkOutDate = scanner.next();
							books[idx].checkOut(borrower, checkOutDate);
						}

					}
					break;
				case 2 :

					System.out.println("What book would you like to return?\n"
							+ "Insert book name: ");
					btitle = scanner.next();
					for (idx = 0; idx < books.length; idx++) {
						if (btitle.equals(books[idx].getBookTitle())) {
							break;
						}
					}
					if (idx == books.length) {
						System.out.println(
								"Our library is currently not hold of this book. Please check the name of the book. ");
					} else {
						if (books[idx].getState() == BookLib.STATE_NORMAL) {
							System.out.println(
									"This book is not marked as borrowed.");
						} else {
							books[idx].checkIn();
						}
					}
					break;

				case 3 :
					System.out.println("Booklist is as follows:");
					for (BookLib book : books) {
						book.printState();
					}
					break;
			}
		} while (fn != 0);
		System.out.println("BYE");

	}
}
