package com.lec.ex08_libraryCD;

public class BookLib extends BookInfo implements ILendable {
	private String borrower;
	private String borrowingDate;
	private String checkoutDate;
	private byte state;
	public BookLib(String bookNo, String bookTitle, String author) {
		super();

	}

	@Override
	public void checkOut(String borrower, String checkoutDate) {
		if (state == STATE_BORROWED) {
			System.out.println("The book " + getBookTitle()
					+ " cannot be borrowed. It is already rented out");
		}

		state = STATE_BORROWED;
		System.out.println("\nThe book " + getBookTitle()
				+ " has been succesfully borrowed. ");
		System.out.println("\n[Borrower]: " + borrower + ", [Date of borrow]:"
				+ checkoutDate);
	}

	@Override
	public void checkIn() {
		state = STATE_NORMAL;
		System.out.println("\nBook titled " + getBookTitle()
				+ " has been succesfully returned");

	}
	@Override
	public void printState() {
		String msg = "[Serial Number]: " + getBookNo() + ", [Book Title]: "
				+ getBookTitle() + ", [Author]: " + getAuthor()
				+ ", [Avaiablility]: ";
		msg = msg + ((state == STATE_NORMAL)
				? "avaible"
				: (state == STATE_BORROWED) ? "borrowed" : "non-trackable");
		System.out.println(msg);
	}

	public String getBorrower() {
		return borrower;
	}

	public void setBorrower(String borrower) {
		this.borrower = borrower;
	}

	public String getBorrowingDate() {
		return borrowingDate;
	}

	public void setBorrowingDate(String borrowingDate) {
		this.borrowingDate = borrowingDate;
	}

	public String getCheckoutDate() {
		return checkoutDate;
	}

	public void setCheckoutDate(String checkoutDate) {
		this.checkoutDate = checkoutDate;
	}

	public byte getState() {
		return state;
	}

	public void setState(byte state) {
		this.state = state;
	}

}
