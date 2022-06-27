package com.lec.ex11_product;

public class ProductMain {
	public static void main(String[] args) {
		Product p1 = new Product();
		p1.infoPrint();
		Product p2 = new Product();
		p2.infoPrint();
		Product p3 = new Product();
		p3.infoPrint();
		System.out.println("static varaible = class variable = shared variable count: " + Product.count);
	}
}
