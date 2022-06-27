package com.lec.ex3_shape;

public class Rectangle extends Shape {
	int width;
	int height;

	public Rectangle(int width, int height) {
		this.width = width;
		this.height = height;
	}

	@Override
	public double computeArea() {
		return width * height;
	}
}
