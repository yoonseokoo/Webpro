package com.lec.ex01_square;

public class SquareMain {
	public static void main(String[] args) {
		Square s1 = new Square();
		Square s2 = new Square(10);
		s1.setSide(5);
		System.out.println("s1's area = " + s1.area());
		System.out.println("s1's side length = " + s1.getSide());
		s2.setSide(50);
		System.out.println("s2's area = " + s2.area());
		
	}
}
