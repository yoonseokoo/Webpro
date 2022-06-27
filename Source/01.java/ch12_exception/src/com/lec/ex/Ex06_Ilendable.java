package com.lec.ex;

public interface Ex06_Ilendable {
	public byte STATE_BORROWED = 1;
	public byte STATE_NORMAL = 0;

	// Throwing exceptions for both CheckIn and CheckOut methods
	public void checkOut(String borrower) throws Exception;

	public void checkIn() throws Exception;
}