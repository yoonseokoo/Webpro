package com.lec.ex08_libraryCD;

public class CdLib extends CdInfo implements ILendable {
	private String borrower;
	private String checkoutDate;
	private byte state;
	public CdLib(String CdNo, String CdTitle, String bookNo) {
		super(CdNo, CdTitle, bookNo);

	}

	@Override
	public void checkOut(String borrower, String checkoutDate) {
		if (state == STATE_BORROWED) {
			System.out.println("The CD " + getCdTitle()
					+ " cannot be borrowed. It is already rented out");
		}
		this.borrower = borrower;
		this.checkoutDate = checkoutDate;
		state = STATE_BORROWED;
		System.out.println("\nThe CD " + getCdTitle()
				+ " has been succesfully borrowed. ");
		System.out.println("\n[Borrower]: " + borrower + ", [Date of borrow]:"
				+ checkoutDate);
	}

	@Override
	public void checkIn() {
		state = STATE_NORMAL;
		System.out.println("\nCD titled " + getCdTitle()
				+ " has been succesfully returned");

	}
	@Override
	public void printState() {
		String msg2 = "[Serial Number]: " + getCdNo() + ", [Book Title]: "
				+ getCdTitle() + ", [Avaiablility]: ";
		msg2 = msg2 + ((state == STATE_NORMAL)
				? "avaible"
				: (state == STATE_BORROWED) ? "borrowed" : "non-trackable");
		System.out.println(msg2);
	}

	public String getBorrower() {
		return borrower;
	}

	public void setBorrower(String borrower) {
		this.borrower = borrower;

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
