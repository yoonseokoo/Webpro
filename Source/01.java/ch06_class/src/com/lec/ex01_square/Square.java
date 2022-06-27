package com.lec.ex01_square;
public class Square {
	private int side;
	
	public Square() {
		System.out.println("Constructor with no parameter");
	}
	public Square(int side) {
		this.side = side;
		System.out.println("Constructor with 1 parameter");
	}
	public int area() { //METHOD 'AREA'
		return side*side;
	}
	public void setSide(int side) {
		this.side = side;
	}
	public int getSide() {
		return side;
	}
}
