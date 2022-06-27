package com.lec.ex1_store;

public abstract class HeadQuarterStore {// This superclass cannot be instantiated and is used
										// to state or define general characteristics.
										// An object cannot be formed from a Java abstract class;
	private String str;

	public HeadQuarterStore(String str) {
		this.str = str;
	}

	public abstract void kimchi();

	public abstract void bude();

	public abstract void bibim();

	public abstract void sundae();

	public abstract void rice();

	public String getStr() {
		return str;
	}

	protected void setStr(String str) {
		this.str = str;
	}

}
