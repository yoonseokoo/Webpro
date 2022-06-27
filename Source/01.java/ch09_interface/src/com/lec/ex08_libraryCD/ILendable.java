package com.lec.ex08_libraryCD;

public interface ILendable {

	public byte STATE_BORROWED = 1; // the book is borrowed by someone
	public byte STATE_NORMAL = 0; // the book is available to borrow
	public void checkOut(String borrower, String checkoutDate); // if book is
																// already
																// borrowed by
																// someone
	public void checkIn(); // return
	public void printState(); // checking its borrowed state
}
