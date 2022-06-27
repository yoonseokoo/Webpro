package com.lec.ex04_shapes;

public class MainClass {
	public static void main(String[] args) {
		BoxOrRect box = new BoxOrRect(5,6,10);
		BoxOrRect rect = new BoxOrRect(10,5);
		box.vPrint();
		rect.vPrint();
		System.out.println("Box's volume: "+box.getVolume());
		System.out.println("rectangle's area: "+ box.getVolume());

	}
}
