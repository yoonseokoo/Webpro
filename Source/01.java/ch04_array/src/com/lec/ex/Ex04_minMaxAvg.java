package com.lec.ex;

import java.util.Scanner;

public class Ex04_minMaxAvg {
	public static void main(String[] args) {
		String[] arrName = { "Anna", "Betty", "Carlos", "Don", "Eddy" };
		int[] arrHeight = new int[arrName.length];
		Scanner scanner = new Scanner(System.in);
		int totalHeight = 0;
		for (int idx = 0; idx < arrName.length; idx++) {
			System.out.print("Enter height of " + arrName[idx] + ":");
			arrHeight[idx] = scanner.nextInt();
			totalHeight += arrHeight[idx]; // totalHeight is a temp variable to sum the inputted heights
		}
		System.out.println("\nAverage Height is " + (double) totalHeight / arrName.length);
		scanner.close();

		int minHeight = 999, minIdx = 0;
		int maxHeight = 0, maxIdx = 0;
		for (int i = 0; i < arrName.length; i++) {
			if (arrHeight[i] < minHeight) {
				minHeight = arrHeight[i];
				minIdx = i;
			}

			if (arrHeight[i] > maxHeight) {
				maxHeight = arrHeight[i];
				minIdx = i;
			}
		}
		System.out.printf("Tallest student is %s, Height: %d\n", arrName[maxIdx], maxHeight);
		System.out.printf("Shortest student is %s, Height: %d\n", arrName[minIdx], minHeight);
	}

}
