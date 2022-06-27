package com.lec.ex;

public class Ex06_coinExample {
	public static void main(String args[]) {
		int[] coinUnit = { 500, 100, 50, 10 };
		int money = 2680;
		System.out.println(money + " won, consists of:");
		for (int i = 0; i < coinUnit.length; i++) {
			int cnt = money / coinUnit[i];
			System.out.print(cnt + " units of " + coinUnit[i] + "won\n");
		}
	}
}
