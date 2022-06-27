package com.lec.ex1_store;

public class Store1 extends HeadQuarterStore {
	public Store1(String str) {
		super(str);

	}

	@Override
	public void bude() {
		System.out.println("Bude stew: 5,000 won");
	}

	@Override
	public void sundae() {
		System.out.println("Store 1 does not sell Sundae stew");
	}

	@Override
	public void kimchi() {
		System.out.println("Kimchi stew: 4,500 won");
	}

	@Override
	public void bibim() {
		System.out.println("Bibim rice: 6,000 won");
	}

	@Override
	public void rice() {
		System.out.println("Rice: 1,000 won");
	}

}
