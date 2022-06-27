package com.lec.strategy5_robot;

public class SuperRobot extends Robot {

	public SuperRobot() {
		setFly(new FlyYes());
		setMissile(new MissileYes());
		setKnife(new KnifeLazer());
	}
	@Override
	public void shape() {
		System.out.println("\n������������"
				+ " This is a super robot. It has super features "
				+ "������������");
	}
}
