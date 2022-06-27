package com.lec.ex4_car;

public class LowGradeCar extends Car {
	private int tax;

	public LowGradeCar(String color, String tire, int displacement, String handle) {
		super(color, tire, displacement, handle);
		tax = 50000;
	}

	@Override
	public void getSpec() {
		if (getDisplacement() > 1000) {
			tax += (getDisplacement() - 1000) * 100;
		}
		System.out.println("Color: " + getColor());
		System.out.println("Tire: " + getTire());
		System.out.println("Displacement: " + getDisplacement());
		System.out.println("Handle: " + getHandle());
		System.out.println("Tax: " + tax);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

	}
}
