package com.lec.ex01_parentchild;

public class ChildClass extends ParentClass {
	private int total;

	public ChildClass() {
		System.out.println("CHILD CONSTRUCTOR");
	}

	public ChildClass(int i, int j) {
		setI(i);
		setJ(j);
		System.out.println("CHILD CONSTRUCTOR WITH 2 PARAMETERS");
	}

	public void sum() {
		total = getI() + getJ();
		System.out.println("\nThis object's i = " + getI() + "\tj = " + getJ());
		System.out.println("\nThis objects sum= " + total);
	}
}