package com.lec.strategy3_car;

public class AccentCar extends Car {

	public AccentCar() {
		setFuel(new FuelDiesel());
		setEngine(new EngineLow());
		setKm(new Km20());
	}
	@Override
	public void features() {
		System.out.println("\n¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á" + " Accent " + "¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á");
	}
}
