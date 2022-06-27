package com.lec.practice;
//class: data and method
//Car c = new Car()
public class Car {
	private String color;
	private int cc;
	private int speed;
	public void drive() { //METHOD: DRIVE
		speed = 60;
			System.out.println("The " + color +" car I am driving has a speed of: " + speed);
				}
	public void park() { //METHOD: PARK
		speed = 0;
		System.out.println("The " + color +" car I am driving has a speed of: " + speed);
			}
	public void race() { //METHOD: RACE
		speed = 120;
			System.out.println("The " + color +" car I am driving has a speed of: " + speed);
		}
	
	//SETTER AND GETTER
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getCc() {
		return cc;
	}
	public void setCc(int cc) {
		this.cc = cc;
	}
	public int getSpeed() {
		return speed;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
}
	

