package com.lec.ex04_object;

public class ex02_RectangleTestMain {
	public static void main(String[] args) throws CloneNotSupportedException {
		ex02_RectangleClass r1 = new ex02_RectangleClass();
		r1.setHeight(10);
		r1.setWidth(5);
		ex02_RectangleClass r2 = (ex02_RectangleClass) r1.clone();
		System.out.println("r1 : " + r1);
		System.out.println("r2 : " + r2);
		System.out.println(r1.equals(r2) ? "Same rectangle" : "Different rectangle");
		System.out.println(r1 == r2 ? "Same address" : "Different address");

		if (r1 != r2 && r1.equals(r2)) {
			System.out.println("Cloning successful");
		} else {
			System.out.println("Cloning Failed");
		}
		System.out.println(r1.hashCode());
		System.out.println(r2.hashCode());
		System.out.println(r1.getClass().getName());
	}
}