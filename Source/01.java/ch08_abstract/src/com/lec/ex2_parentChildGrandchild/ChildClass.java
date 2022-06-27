package com.lec.ex2_parentChildGrandchild;

public class ChildClass extends SuperClass {

	@Override
	public void method1() {
		System.out.println("method1 of ChildClass - Since it is abstract, we must override it");
	}

	@Override
	public void method2() {
		System.out.println("method2 of ChildClass - override is not necessary but it can be done");
	}

}
