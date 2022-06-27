package com.lec.ex08_libraryCD;

public class CdInfo {
	private String CdNo;
	private String CdTitle;
	private String bookNo;

	public CdInfo(String CdNo, String CdTitle, String bookNo) {
		this.CdNo = CdNo;
		this.CdTitle = CdTitle;
		this.bookNo = bookNo;
	}
	public CdInfo() {
	}
	public String getCdNo() {
		return CdNo;
	}
	public String getCdTitle() {
		return CdTitle;
	}
	public String getBookNo() {
		return bookNo;

	}

}
