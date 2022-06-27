package com.lec.strategy5_robot;

public class StandardRobot extends Robot {
	public StandardRobot() {
		setFly(new FlyNo());
		setMissile(new MissileYes());
		setKnife(new KnifeWood());
	}
	@Override
	public void shape() {
		System.out.println("\n¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á"
				+ " This is a standard robot. It has standard features "
				+ "¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á");
	}
}
