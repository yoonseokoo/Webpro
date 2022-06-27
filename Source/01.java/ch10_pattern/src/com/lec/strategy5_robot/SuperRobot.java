package com.lec.strategy5_robot;

public class SuperRobot extends Robot {

	public SuperRobot() {
		setFly(new FlyYes());
		setMissile(new MissileYes());
		setKnife(new KnifeLazer());
	}
	@Override
	public void shape() {
		System.out.println("\n¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á"
				+ " This is a super robot. It has super features "
				+ "¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á");
	}
}
