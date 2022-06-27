package com.lec.ex;

public class Ex07_Order {
	public static void main(String[] args) {
		int[] arr = { 76, 34, 45, 89, 100, 50, 90, 92 };
		int temp;

		for (int i = 0; i < arr.length - 1; i++) // when i=0 | when i=1
			for (int j = i + 1; j < arr.length; j++) // j=1 | i=2
				if (arr[i] < arr[j]) { // since 76 > 34, if statement is skipped | since 45 < 35

					temp = arr[i]; // temp = 34
					arr[i] = arr[j]; // arr[1] = 45
					arr[j] = temp; // arr[2] = 34
				}
		System.out.print("Descending Order: ");
		for (int i = 0; i < arr.length - 1; i++) {
			System.out.print(arr[i] + ","); // arr[0] = 76 | arr[1] = 45
		}
	}
}