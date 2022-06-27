package com.lec.singleton1;

public class TestMain {
	public static void main(String[] args) {
		SingletonClass obj1 = SingletonClass.getInstance();
		SingletonClass obj2 = SingletonClass.getInstance(); // BOTH OBJECTS FOLLOW THE SAME METHOD THROUGH THE SINGLETON
															// CLASS AND ONE VALUE IS SAVED UNDER 'INSTANCE'
		System.out.println("obj1's i is: " + obj1.getI()); // 0
		obj1.setI(99); // OBJ1, OBJ2 = 99
		System.out.println("obj1's i is: " + obj1.getI()); // 99
		System.out.println("obj2's i is: " + obj2.getI()); // 99
		obj2.setI(100); // OBJ1, OBJ2 = 100
		System.out.println("obj1's i is: " + obj1.getI()); // 100
		System.out.println("obj2's i is: " + obj2.getI()); // 100
	}
}
