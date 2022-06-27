package com.lec.strategy5_robot;

public class MissileYes implements IMissile {
	@Override
	public void missile() {
		System.out.println("[Missile] : " + "Can fire a missile");
	}
}
