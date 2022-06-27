package com.lec.ex03_math;

public class ex02_round {
	public static void main(String[] args) {

		System.out.println("9.15, round up (unit): " + (int) Math.ceil(9.15));
		System.out.println("9.15, round (unit) : " + Math.round(9.15));
		System.out.println("9.15 round down (unit) : " + (int) Math.floor(9.15));

		System.out.println("9.15, round up (1.d.p): " + Math.ceil(9.15 * 10) / 10); // 9.2
		System.out.println("9.15, round (1.d.p) : " + Math.round(9.15 * 10) / 10.0);
		System.out.println("9.15 round down (1.d.p) : " + Math.floor(9.15 * 10) / 10); // 9.1

		System.out.println("85, round up (tens) " + (int) Math.ceil(85 / 10.0) * 10);
		System.out.println("85, round (tens) : " + Math.round(85 / 10.0) * 10);
		System.out.println("85, round down (tens) : " + (int) Math.floor(85 / 10.0) * 10);
	}
}