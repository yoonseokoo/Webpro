package com.lec.loop;

public class Ex01_arithmeticFor {
	public static void main(String[] args) {
		int sum = 0;
//		int tot = 1;
		for (int i = 1; i <= 20; i++) {
			System.out.print(i);
			if (i != 20)
				System.out.print("+");
			sum += i; // Finding sum
//			tot *= i; // Finding multiplicative total
		}
		System.out.println("=" + sum);
//		System.out.println("=" + tot);

	}
}
