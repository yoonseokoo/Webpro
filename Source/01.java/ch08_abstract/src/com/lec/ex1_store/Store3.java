package com.lec.ex1_store;

public class Store3 extends HeadQuarterStore {
	public Store3(String str) {
		super(str);
	}

	@Override
	public void kimchi() {
		System.out.println("Kimchi stew: 6,000won");
	}

	@Override
	public void bude() {
		System.out.println("Bude stew: 7,000won");
	}

	@Override
	public void bibim() {
		System.out.println("Bibim rice: 7,000won");
	}

	@Override
	public void sundae() {
		System.out.println("Sundae Stew: 6,000won");
	}

	@Override
	public void rice() {
		System.out.println("Free");

	}

}
