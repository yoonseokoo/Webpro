package com.lec.practice;

import java.util.Scanner;

public class Ex01_practice {
	public static void main(String[] args) {
		int totalHeight = 0;
		int totalHeight2 = 0;
		int averageHeight = 0;
		int averageHeight2 = 0;

		// (A)
		String[][] name = { { "Amy", "Ben", "Carl", "Dan", "Eddy" }, { "Smith", "Lodge", "Lee", "Bello", "Valle" } };
		Scanner scanner = new Scanner(System.in);
		int[] height2021 = { 168, 183, 188, 173, 190 };
		System.out.println("[Please enter your height in 2022]\n");
		for (int temp : height2021) {
			totalHeight += temp; // (B)
		}
		averageHeight = totalHeight / 5;

		int[] height2022 = new int[5]; // (C)
		for (int idx = 0; idx < 5; idx++) {
			System.out.print(name[0][idx] + " " + name[1][idx] + "\t [2021]: " + height2021[idx] + "\t [2022]: ");
			height2022[idx] = scanner.nextInt(); // (D)
		}
		for (int temp2 : height2022) {
			totalHeight2 += temp2;
			averageHeight2 = (totalHeight2) / 5;
		}

		System.out.println("\nAverage\t\t [2021]: " + averageHeight + "\t [2022]: " + averageHeight2);

		int minHeight = 999, minIdx = 0;
		int maxHeight = 0, maxIdx = 0;
		int minHeight22 = 999, minIdx22 = 0;
		int maxHeight22 = 0, maxIdx22 = 0;
		for (int i = 0; i < height2021.length; i++) {
			if (height2021[i] < minHeight) {
				minHeight = height2021[i];
				minIdx = i; // (E)
			}
			if (height2021[i] > maxHeight) {
				maxHeight = height2021[i];
				maxIdx = i;
			}
			if (height2022[i] < minHeight22) {
				minHeight22 = height2022[i];
				minIdx22 = i;
			}
			if (height2022[i] > maxHeight22) {
				maxHeight22 = height2022[i];
				maxIdx22 = i;
			}
		}
		System.out.println("\n\t\tTallest and Shortest");
		System.out.printf("\nTallest: \t [2021]: %d (person %s)\t [2022]: %d (person %s)\n", maxHeight, maxIdx + 1,
				maxHeight22, maxIdx22 + 1);
		System.out.printf("Shortest: \t [2021]: %d (person %s)\t [2022]: %d (person %s)\n", minHeight, minIdx + 1,
				minHeight22, minIdx22 + 1);
		scanner.close();
	}
	// (A): Making a two dimensional array named "name"
	// (B): Starting from the value in array 0 ~ 4, add up the numbers
	// (C): Create an empty array named "height2022" with its length equal to that
	// of "height2021"
	// (D): Fill in "height2022" from array 0, by inserting the value the user
	// enters.

}
