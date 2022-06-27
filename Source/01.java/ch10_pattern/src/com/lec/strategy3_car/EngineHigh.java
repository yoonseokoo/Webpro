package com.lec.strategy3_car;

public class EngineHigh implements IEngine {
	@Override
	public void engine() {
		System.out.println("[Engine] : " + "Best quality engine");
	}
}
