package com.lec.ex08_store;

public class Store1 extends HeadQuarterStore {
	public Store1(String str) {
		super(str);

	}

	@Override
	public void bude() {
		System.out.println("Bude stew: 5,000won");
	}

	@Override
	public void sundae() {
		System.out.println("Store 1 does not sell Sundae stew");
	}

}
