package com.lec.ex3_shape;

public class TestMain {
	public static void main(String[] args) {

		Shape[] shape = { new Rectangle(10, 5), new Triangle(5, 6), new Circle(5) };
		for (Shape s : shape) {
			s.draw();
			System.out.println("Calculated area is" + s.computeArea());
		}

	}
}
