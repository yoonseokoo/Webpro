package com.lec.ex11_product;

public class Product {
	private int serialNo;
	public static int count = 100;

	public Product() {
		serialNo = ++count;
	}

	public void infoPrint() {
		System.out.println("serialNo =" + serialNo + "\tshared variable count = " + count);
	}
}
