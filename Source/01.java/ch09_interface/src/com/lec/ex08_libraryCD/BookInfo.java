package com.lec.ex08_libraryCD;

public class BookInfo {
	private String bookNo; // mixture of numbers and letters
	private String bookTitle;
	private String author;

	public BookInfo(String bookNo, String bookTitle, String author) {
		super();
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.author = author;
	}
	public BookInfo() {
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public String getBookNo() {
		return bookNo;
	}
	public String getAuthor() {
		return author;
	}

}
