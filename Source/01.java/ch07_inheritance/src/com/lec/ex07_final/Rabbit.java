package com.lec.ex07_final;

public final class Rabbit extends Animal { // because of 'final', Rabbit class cannot be inherited

	@Override
	public void running() { // OVERRIDING THE 'RUNNING' VARIBALE IN THE PARENTCLASS
		setSpeed(getSpeed() + 30);
		System.out.println("It's sprinting. Current speed: " + getSpeed());
	}

}
