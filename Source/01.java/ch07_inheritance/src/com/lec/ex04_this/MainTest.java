package com.lec.ex04_this;

public class MainTest {
	public static void main(String[] args) {
		Friend f1 = new Friend();
		System.out.println(f1.infoString());
		Friend f2 = new Friend("Amy");
		System.out.println(f2.infoString());
		Friend f3 = new Friend("Amy", "010-7645-9999");
		System.out.println(f3.infoString());

		Friend f4 = new Friend("Amy");
		if (f2.equals(f4)) {
			System.out.println("f2 and f4 are the same");
		} else {
			System.out.println("f2 and f4 are different");

			Friend f5 = f2;
			if (f5.equals(f2)) {
				System.out.println("f2 and f5 are the same");
			} else {
				System.out.println("f2 and f5 are different");
			}
		}
	}
}
