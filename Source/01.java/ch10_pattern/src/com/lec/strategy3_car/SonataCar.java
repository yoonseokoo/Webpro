package com.lec.strategy3_car;

public class SonataCar extends Car {

	public SonataCar() {
		setFuel(new FuelGasoline());
		setEngine(new EngineMid());
		setKm(new Km15());
	}
	@Override
	public void features() {
		System.out.println("\n¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á" + " Sonata " + "¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á");
	}
}
