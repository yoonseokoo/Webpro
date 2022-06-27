package com.lec.strategy5_robot;

public class LowRobot extends Robot {
	public LowRobot() {
		setFly(new FlyNo());
		setMissile(new MissileNo());
		setKnife(new KnifeNo());
	}
	@Override
	public void shape() {
		System.out.println("\n������������"
				+ " This is a low robot. It has low features " + "������������");
	}
}
