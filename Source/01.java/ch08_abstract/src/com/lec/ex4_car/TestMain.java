package com.lec.ex4_car;

public class TestMain {
	public static void main(String[] args) {
//		Car car = new LowGradeCar(CarSpec.GREY_CAR, CarSpec.TIRE_NORMAL, CarSpec.DISPLACEMENT_1000,
//				CarSpec.HANDDLE_POWER);

		Car car = new HighGradeCar(CarSpec.WHITE_CAR, CarSpec.TIRE_WIDE, CarSpec.DISPLACEMENT_2200,
				CarSpec.HANDDLE_POWER);
		car.getSpec();
	}
}
