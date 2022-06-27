package com.lec.strategy3_car;

public class FuelGasoline implements IFuel {
	@Override
	public void fuel() {
		System.out.println("[Fule type] : " + "It runs on Gasoline");
	}
}
