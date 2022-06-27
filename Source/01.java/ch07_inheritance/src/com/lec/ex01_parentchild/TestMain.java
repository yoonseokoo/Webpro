package com.lec.ex01_parentchild;

public class TestMain {
	public static void main(String[] args) {
		ChildClass child = new ChildClass(); // WHEN CHILDCLASS OBJECT IS CALLED, CONSTRUCTOR FROM BOTH PARENT & CHILD
												// CLASS IS RUN
		child.getMamiName();
		child.getPapiName(); // METHODS MADE IN PARENTCLASS CAN BE USED BY THE CHILD OBJECT
		ChildClass child2 = new ChildClass(1, 2);
		System.out.println("Child2's i: " + child2.getI()); // 1 -> setI(1) -> getI = 1
		System.out.println("Child2's j: " + child2.getJ()); // 2 -> setJ(2) -> getJ = 2
		child2.setI(10);
		child2.setJ(5);
		child2.sum();
	}
}
