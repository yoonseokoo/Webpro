package com.lec.practice;

public class CarTestMain {
	public static void main(String[] args) {
		Car myPorsche = new Car();
		
		myPorsche.setColor("red");
		System.out.println( "Riding " + myPorsche.getColor() + " car with " + "cc:" +myPorsche.getCc() + " Speed:" +myPorsche.getSpeed());
		myPorsche.drive();
		myPorsche.park();
		myPorsche.race(); //NOW SPEED IS 120
		System.out.println(myPorsche.getSpeed());
	
		Car yourPorsche = new Car();
		yourPorsche.setColor("gray");
		yourPorsche.drive();
	}
}