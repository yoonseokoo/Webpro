package com.lec.ex01;

public class TestMain {
	public static void main(String[] args) {
		InterfaceClass obj1 = new InterfaceClass();
		obj1.method1();
		obj1.method2();
		System.out.println(InterfaceEx1.CONSTANT_NUM + "/" + InterfaceEx2.CONSTANT_STRING);
		InterfaceEx1 obj2 = new InterfaceClass();
		obj2.method1();
		if (obj2 instanceof InterfaceClass) { // 앞에있는 변수가 뒤에 있는 Class의 객체가 맞냐?
			((InterfaceClass) obj2).method2();
		}
		InterfaceEx2 obj3 = new InterfaceClass();
		obj3.method2();
		System.out.println(InterfaceEx2.CONSTANT_STRING);
	}
}

//within obj1, both method1 and method2 can be processed, as it can implement both methods that are in 'InterfaceClass'
//within obj2, only method 1 can be processed, as it can only implement methods in InterfaceEx1
//within obj3, only method 2 can be processed, as it can only implement methods in InterfaceEx2