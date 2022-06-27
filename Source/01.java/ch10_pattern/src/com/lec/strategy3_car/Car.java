package com.lec.strategy3_car;

public abstract class Car {
	private IFuel fuel;
	private IEngine engine;
	private IKm km;
	public void propertyDrive() {
		System.out.println("[Drive] : Car can Drive");
	}

	public abstract void features();

	public void propertyFuel() {
		fuel.fuel();
	}
	public void propertyEngine() {
		engine.engine();
	}
	public void propertyMileage() {
		km.km();
	}

	public void setFuel(IFuel fuel) {
		this.fuel = fuel;
	}

	public void setEngine(IEngine engine) {
		this.engine = engine;
	}

	public void setKm(IKm km) {
		this.km = km;
	}

}
