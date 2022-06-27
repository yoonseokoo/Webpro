package com.lec.test;

public class CustomerDto {
	private String ctel;
	private String cname;
	private int cpoint;

	public CustomerDto(String ctel, String cname, int cpoint) {
		super();
		this.ctel = ctel;
		this.cname = cname;
		this.cpoint = cpoint;
	}

	@Override
	public String toString() {
		return ctel + "\t\t" + cname + "\t" + cpoint + "\t";
	}

	public String getCtel() {
		return ctel;
	}

	public String getCname() {
		return cname;
	}

	public int getCpoint() {
		return cpoint;
	}

}
