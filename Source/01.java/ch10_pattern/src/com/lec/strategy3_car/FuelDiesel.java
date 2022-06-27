package com.lec.strategy3_car;

public class FuelDiesel implements IFuel {
	@Override
	public void fuel() {
		System.out.println("[Fule type] : " + "It runs on Diesel");
	}
}
