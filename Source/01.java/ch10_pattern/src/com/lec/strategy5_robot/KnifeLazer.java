package com.lec.strategy5_robot;

public class KnifeLazer implements IKnife {
	@Override
	public void knife() {
		System.out.println("[Knife Type] : " + "It has a Lazer Knife");
	}
}
