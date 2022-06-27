package com.lec.ex;

public class Ex05_multiDimentional {
	public static void main(String[] args) {
		int total = 0;
		// One dimensional
		int[] arr = { 1, 2, 3 };

		// Two dimensional
		int[][] test = { { 1, 2, 3 }, { 4, 5, 6 } };
		System.out.println("arr[2] = " + arr[2]);
		System.out.println("test[0][0] = " + test[0][0] + "\n"); // test[row][column]

		for (int i = 0; i < test.length; i++) {
			for (int j = 0; j < test[i].length; j++) { // test[0].length is 3
				System.out.printf("test[%d][%d] = %d\n", i, j, test[i][j]);
				total += test[i][j];
			}
		}
		System.out.println("Sum of all numbers in the array 'test' = " + total);
	}
}
