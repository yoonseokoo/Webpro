package com.lec.strategy5_robot;

public class MainClass {
	public static void main(String[] args) {

		System.out.println(
				"Which Robot would you like to order? The following shows the features of each type of Robot: ");
		Robot superRob = new SuperRobot(); // define the object 'superRob' of
											// the
											// type 'Robot and call to the class
											// constructor "SuperRobot", which
											// initializes the superRob'

		Robot standardRob = new StandardRobot();
		Robot lowRob = new LowRobot();
		Robot[] robots = {superRob, standardRob, lowRob};
		for (Robot r : robots) {
			r.shape();
			r.actionWalk();
			r.actionRun();
			r.actionFly();
			r.actionMissile();
			r.actionknife();
		}
	}
}
