package com.lec.ex04_object;

public class ex03_Point3DTestMain {
	public static void main(String[] args) throws CloneNotSupportedException {
		ex03_Point3DClass a = new ex03_Point3DClass();
		ex03_Point3DClass b = new ex03_Point3DClass(5.5, 4.4, 3.3);
		ex03_Point3DClass c = (ex03_Point3DClass) b.clone();
		if (b != c && b.equals(c)) { // if b and c have a different address but the same value
			System.out.println("Cloning unsuccessful");
		} else {
			System.out.println("Cloning successful");
		}
		System.out.println("a" + a);
		System.out.println("b" + b);
		System.out.println("c" + c);
	}
}