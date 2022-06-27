package com.lec.strategy3_car;

public class GenesisCar extends Car {

	public GenesisCar() {
		setFuel(new FuelGasoline());
		setEngine(new EngineHigh());
		setKm(new Km10());
	}
	@Override
	public void features() {
		System.out.println("\n¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á" + " Genesis " + "¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á");
	}
}
