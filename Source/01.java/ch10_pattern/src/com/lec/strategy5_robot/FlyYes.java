package com.lec.strategy5_robot;

public class FlyYes implements IFly {
	@Override
	public void fly() {
		System.out.println("[Fly] : " + "Can fly");
	}
}
