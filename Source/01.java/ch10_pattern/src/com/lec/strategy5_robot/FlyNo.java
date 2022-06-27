package com.lec.strategy5_robot;

public class FlyNo implements IFly {
	@Override
	public void fly() {
		System.out.println("[Fly] : " + "Cannot fly");
	}
}
