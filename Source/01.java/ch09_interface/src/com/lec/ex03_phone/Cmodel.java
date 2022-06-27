package com.lec.ex03_phone;

public class Cmodel implements IAcorporation {
	private String modelName;
	public Cmodel() {
		modelName = "C model";
	}
	@Override
	public void dmbReceive() {
		System.out.println(modelName + " does not have the DBM tehcnology");
	}
	@Override
	public void lte() {
		System.out.println(modelName + "is not LTE");
	}
	@Override
	public void tvRemoteControl() {
		System.out.println(modelName + "does not have a TV remote control");
	}
}
