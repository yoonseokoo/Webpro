package com.lec.ex02_human;

public class Man {
	private int age;
	private int height;
	private double weight;
	private String phoneNum;  

	public Man () {} //CONSTRUCTOR
	public Man(int age) { //CONSTRUCTOR
		this.age = age;
	}
	public Man(int age , int height, double weight) { //CONSTRUCTOR
		this.age = age;
		this.height = height;
		this.weight = weight;
			System.out.println("Method 'Man' with 3 parameters");
}
	public Man(int age , int height, double weight, String phoneNum) { //CONSTRUCTOR
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.phoneNum = phoneNum;
			System.out.println("Method 'Man' with 4 parameters");
		}
	//METHOD FOR BMI
		public double calculateBMI() {
			double result = weight / ((height/100.0)*(height/100.0));
				return result;
		}
	//SETTER & GETTER
		public void setAge(int age) {
			this.age = age;
		}
		public void setHeight(int height) {
			this.height = height;
		}
		public void setWeight(double weight) {
			this.weight = weight;
		}
		public void setPhoneNum(String phoneNum) {
			this.phoneNum = phoneNum;
		}
		public int getAge() { 
			return age; 
}
		public int getHeight() { 
			return height; 
		}
		public double getWeight() { 
			return weight; 
		}
		public String getPhoneNum() { 
			return phoneNum; 
		}
}