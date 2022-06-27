package com.lec.strategy5_robot;

public abstract class Robot {
	private IFly fly;
	private IMissile missile;
	private IKnife knife;
	public void actionWalk() {
		System.out.println("[Walk] : " + "It can Walk");
	}
	public void actionRun() {
		System.out.println("[Run] : " + "It can run");
	}
	public abstract void shape();
	public void actionFly() {
		fly.fly();
	}
	public void actionMissile() {
		missile.missile();
	}
	public void actionknife() {
		knife.knife();
	}
	public void setFly(IFly fly) {
		this.fly = fly;
	}
	public void setMissile(IMissile missile) {
		this.missile = missile;
	}
	public void setKnife(IKnife knife) {
		this.knife = knife;
	}
}
