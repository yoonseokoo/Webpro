package com.lec.ex03_phone;

public class Bmodel implements IAcorporation {
	private String modelName;
	public Bmodel() {
		modelName = "B model";
	}
	@Override
	public void dmbReceive() {
		System.out.println(modelName + " has the DBM tehcnology");
	}
	@Override
	public void lte() {
		System.out.println(modelName + " is LTE");
	}
	@Override
	public void tvRemoteControl() {
		System.out.println(modelName + " comes with a TV remote control");
	}
}
