package com.lec.ex3_shape;

public class Circle extends Shape {
	private int radius;

	public Circle(int radius) {
		this.radius = radius;
	}

	@Override
	public double computeArea() {
		return (radius ^ 2) * Math.PI;
	}
}
