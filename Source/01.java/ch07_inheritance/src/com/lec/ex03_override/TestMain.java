package com.lec.ex03_override;

public class TestMain {
	public static void main(String[] args) {
		ParentClass pObj1 = new ParentClass(); // "ParentClass constructor"
		ParentClass pObj2 = new ParentClass(1); // "ParentClass constructor with 1 parameter"
		if (!pObj1.equals(pObj2)) {
			System.out.println("Two objects are different"); // "Two objects are different"
		} else {
			System.out.println("Two objects are the same");
		}
		ChildClass cObj = new ChildClass(2); // "ParentClass constructor"
												// "ChildClass constructor with 1 parameter"
		if (cObj.equals(pObj2)) {
			System.out.println("TRUE"); // "TRUE"
		}
		pObj1.method1(); // "ParentClass method1() function"
		pObj1.method2(); // "ParentClass method2() function"
		System.out.println("----------------------");
		cObj.method1(); // "ChildClass¿« Method1() function"
		cObj.method2(); // "ParentClass method2() function"
		cObj.method3(); // "ChildClass Method3() function"
		ParentClass cObj1 = new ParentClass(2); // "ParentClass constructor with 1 parameter"
		cObj1.method1(); // "ParentClass method1() function"
		cObj1.method2(); // "ParentClass method2() function"

		// Can we convert the variable c0j1 (ParentClass type) to a ChildClass type?
		if (cObj1 instanceof ChildClass) {
			((ChildClass) cObj1).method3();
		} else {
			System.out.println("CASTING NOT POSSIBLE"); // "CASTING NOT POSSIBLE"
		}
	}
}
