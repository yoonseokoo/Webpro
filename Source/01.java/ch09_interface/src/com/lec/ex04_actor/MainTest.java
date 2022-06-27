package com.lec.ex04_actor;

public class MainTest {
	public static void main(String[] args) {
		Actor leo = new Actor("Dicaprio");
		leo.findCulprit();
		leo.findObject();
		leo.closeFire();
		leo.savePerson();
		leo.makePizza();
		leo.makePasta();
		IChef chefLeo = new Actor("Dicaprio the chef");
		chefLeo.makePizza();
		chefLeo.makePasta();
		IPolice policeLeo = new Actor("Dicaprio the policeman");
		policeLeo.findCulprit();
		policeLeo.findObject();
		IFirefighter firefighterLeo = new Actor("Dicaprio the Fireman");
		firefighterLeo.closeFire();
		firefighterLeo.savePerson();
	}
}
