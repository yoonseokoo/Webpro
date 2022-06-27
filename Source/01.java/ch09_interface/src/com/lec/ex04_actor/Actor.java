package com.lec.ex04_actor;

public class Actor implements IChef, IFirefighter, IPolice {
	private String name;
	public Actor(String name) {
		this.name = name;
	}

	@Override
	public void findCulprit() {
		System.out.println(name + " can catch a criminal");
	}

	@Override
	public void findObject() {
		System.out.println(name + " can find objects");
	}

	@Override
	public void closeFire() {
		System.out.println(name + " can put off fire");
	}

	@Override
	public void savePerson() {
		System.out.println(name + " can save people");

	}

	@Override
	public void makePizza() {
		System.out.println(name + " can make pizza");
	}

	@Override
	public void makePasta() {
		System.out.println(name + " can make pasta");
	}

}
