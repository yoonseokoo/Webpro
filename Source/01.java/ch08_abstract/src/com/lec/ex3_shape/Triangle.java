package com.lec.ex3_shape;

public class Triangle extends Shape {
	private int width;
	private int height;

	public Triangle(int width, int height) {
		this.width = width;
		this.height = height;
	}

	@Override
	public double computeArea() {
		return width * height * 0.5;
	}
}
