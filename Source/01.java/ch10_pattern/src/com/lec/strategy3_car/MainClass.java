package com.lec.strategy3_car;

public class MainClass {
	public static void main(String[] args) {

		System.out.println(
				"The following shows the properties of each type of Car: ");
		Car GenesisCar = new GenesisCar();
		Car SonataCar = new SonataCar();
		Car AccentCar = new AccentCar();
		Car[] cars = {GenesisCar, SonataCar, AccentCar};
		for (Car c : cars) {
			c.features();
			c.propertyDrive();
			c.propertyFuel();
			c.propertyEngine();
			c.propertyMileage();

			SonataCar.setFuel(new FuelHybrid());
			SonataCar.propertyFuel();

		}
	}
}
