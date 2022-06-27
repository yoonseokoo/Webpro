package com.lec.ex03_override;

//If subclass (child class) has the same 
//method as declared in the parent class, 
//it is known as method overriding in Java

public class ChildClass extends ParentClass {
	public ChildClass() {
		System.out.println("ChildClass constructor");
	}

	public ChildClass(int i) {
		System.out.println("ChildClass constructor with 1 parameter");
	}

	public void method3() {
		System.out.println("ChildClass Method3() function");
	}

	@Override
	public void method1() {
		System.out.println("ChildClass¿« Method1() function");
	}

	@Override
	public boolean equals(Object obj) {
		return true;
	}
}
