package com.lec.strategy3_car;

public class FuelHybrid implements IFuel {

	@Override
	public void fuel() {
		System.out.println("[Fule type] : " + "Electric Hybrid");

	}

}
