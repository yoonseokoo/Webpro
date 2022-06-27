package com.lec.ex01;

public class InterfaceClass implements InterfaceEx1, InterfaceEx2 {
	@Override
	public String method2() {
		System.out.println("The actual implementation happens in InterfaceEx2, method2 ");
		return null;
	}

	@Override
	public void method1() {
		System.out.println("The actual implementation happens in InterfaceEx1, method1 ");
	}
}
