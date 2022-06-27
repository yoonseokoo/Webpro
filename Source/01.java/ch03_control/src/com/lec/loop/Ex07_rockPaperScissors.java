package com.lec.loop;

import java.util.Scanner;

public class Ex07_rockPaperScissors {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int you, computer;
		do {
			computer = (int) (Math.random() * 3);
			System.out.print("Pick: Scissors(0), Rock(1), Paper(2) ");
			you = sc.nextInt();
			if (you == 0) {
				System.out.print("You picked Scissors\t");
			} else if (you == 1) {
				System.out.print("You picked Rock\t");
			} else if (you == 2) {
				System.out.print("You picked Paper\t");
			} else {
				System.out.print("Invalid num");
				you = 3; // condition to end
			}
			if (you != 3) {
				String msg = (computer == 0) ? "Computer is Scissors"
						: (computer == 1) ? "Computer is Rock" : "Computer is Papers";
				System.out.println(msg);

				if ((you + 1) % 3 == computer) {
					System.out.println("You lost");
					break;
				} else if (you == computer) {
					System.out.println("It's a draw!");
				} else {
					System.out.println("You won!");
				}
			}
		} while (true); // repeat the game until the user inserts a valid number
		System.out.println("BYE");
	}
}
