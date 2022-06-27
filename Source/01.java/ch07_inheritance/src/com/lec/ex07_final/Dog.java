package com.lec.ex07_final;

public class Dog extends Animal {

	@Override
	public void running() { // OVERRIDING THE 'RUNNING' VARIBALE IN THE PARENTCLASS
		setSpeed(getSpeed() + 10);
		System.out.println("Its tail is waging! Current speed: " + getSpeed());
	}

}
