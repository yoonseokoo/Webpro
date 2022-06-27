package com.lec.ex08_store;

public class HeadQuarterStore {
	private String str;

	public HeadQuarterStore(String str) {
		this.str = str;
	}

	public void kimchi() {
		System.out.println("Kimchi Stew: 5,000won");
	}

	public void bude() {
		System.out.println("Bude stew: 5,000won");
	}

	public void bibim() {
		System.out.println("Bibim rice: 6,000won");

	}

	public void sundae() {
		System.out.println("Sundae stew: 5,000won");
	}

	public void rice() {
		System.out.println("Rice: 1,000won");
	}

	protected String getStr() {
		return str;
	}

	protected void setStr(String str) {
		this.str = str;
	}

}
