package com.lec.strategy3_car;

public class EngineLow implements IEngine {
	@Override
	public void engine() {
		System.out.println("[Engine] : " + "Low quality engine");
	}
}
