package com.lec.ex04_object;

public class ex01_SawonTestMain {
	public static void main(String[] args) {
		ex01_SawonClass s1 = new ex01_SawonClass("a01", "UNIE", ex01_dept_StaticFinal.COMPUTER);
		ex01_SawonClass s2 = new ex01_SawonClass("a02", "CHARLIE", ex01_dept_StaticFinal.HUMANRESOURCES, 2022, 3, 24);
		System.out.println(s1);
		System.out.println(s2);
	}
}