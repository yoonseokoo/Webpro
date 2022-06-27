package com.lec.ex03_phone;

public class Amodel implements IAcorporation {
	private String modelName;
	public Amodel() {
		modelName = "A model";
	}
	@Override
	public void dmbReceive() {
		System.out.println(modelName + " has the DBM tehcnology");
	}
	@Override
	public void lte() {
		System.out.println(modelName + " is 5G");
	}
	@Override
	public void tvRemoteControl() {
		System.out.println(modelName + "has a TV remote control");
	}
}
