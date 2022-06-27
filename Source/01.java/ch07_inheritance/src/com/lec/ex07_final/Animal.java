package com.lec.ex07_final;

public class Animal {
	private int speed;

	public void running() {
	}

	public void stop() {
		speed = 0;
		System.out.println("Stop" + ". Current speed is 0");
	}

	protected int getSpeed() {
		return speed;
	}

	protected void setSpeed(int speed) {
		this.speed = speed;
	}

}
