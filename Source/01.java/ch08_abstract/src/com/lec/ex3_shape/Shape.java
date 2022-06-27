package com.lec.ex3_shape;

public abstract class Shape {
	public void draw() {
		String className = this.getClass().getName();
		System.out.println(className + "Draw the shape");
	}

	public abstract double computeArea();

}
