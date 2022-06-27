package com.lec.practice;

import java.util.Scanner;

public class Ex02_practiceStock {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("If you would like to invest in stock 'A', enter your age: ");
		int age = scanner.nextInt();
		int score;
		int participate = 0;

		if (age <= 18) {
			System.out.println("You are too young for this investment platform. \nBYE");

		} else if (age > 65) {
			System.out.println("You are too old for this investment platform. \nBYE");

		} else {
			System.out.println(
					"You are able to participate,\nFor safe investing, we only allow people \nwho received higher than a B in their Finance entry exam. \n\nPlease enter your exam score (0~100): \n");
		}
		score = scanner.nextInt();
		int temp = score == 100 ? score - 1 : score;
		temp = (-9 <= temp && temp < 0) ? -10 : temp;
		switch (temp / 10) {
		case 9:
		case 8:
			System.out.println("You can participate\n");
			participate = 1;
			break;
		case 7:
		case 6:
		case 5:
		case 4:
		case 3:
		case 2:
		case 1:
		case 0:
			System.out.println("You cannot participate");
			System.out.println("\nBYE");
			break;
		default:
			System.out.println("\nPlease enter a valid score: ");
		}
		if (participate == 1) {
			float stockPrice = (float) (Math.random() * 10);
			System.out.printf(
					"The current stock price for one stock of A is: $%4.2f \nHow many would you like to buy: ",
					stockPrice);
			double amount = scanner.nextInt();
			double cost = amount * stockPrice;
			System.out.printf("\nTotal cost for you is $%4.2f.\n", cost);
			float random = -1 + (float) (Math.random() * ((10 - (-10)) + 10));
			if (random > 0) {
				float stockPrice2 = (float) (((random / 100) + 1) * stockPrice);
				double cost2 = amount * stockPrice2;
				System.out.printf(
						"\nThe stock's value is now $%4.2f per stock. \nTotal value of your stock is $%4.2f. Your total gain is: $%4.2f",
						stockPrice2, cost2, cost2 - cost);
			} else if (random < 0) {
				float stockPrice2 = (float) ((1 + (random / 100)) * stockPrice);
				double cost2 = amount * stockPrice2;
				System.out.printf(
						"\nThe stock's value is now $%4.2f per stock. \nTotal value of your stock is $%4.2f. Your total loss is: $%4.2f",
						stockPrice2, cost2, cost2 - cost);
			} else {
				System.out.println("You have no gain or loss");
			}
			System.out.println("\n\nThank you. BYE");

		}
		scanner.close();
	}

}