package com.lec.strategy5_robot;

public class MissileNo implements IMissile {
	@Override
	public void missile() {
		System.out.println("[Missile] : " + "Cannot fire a missle");
	}
}
