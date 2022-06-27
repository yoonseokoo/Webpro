package com.lec.ex08_store;

public class Store2 extends HeadQuarterStore {
	public Store2(String str) {
		super(str);

	}

	@Override
	public void bude() {
		System.out.println("Bude stew: 5,000won");
	}

	@Override
	public void bibim() {
		System.out.println("Bibim rice: 5,000won");
	}

	@Override
	public void rice() {
		System.out.println("Free");
	}
}
