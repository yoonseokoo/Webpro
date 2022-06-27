package com.lec.ex03_math;

import java.util.Random;

public class ex04_lotto {
	public static void main(String[] args) {
		int[] lotto = new int[6]; // MAKE SPACE FOR 6 INTEGERS
		Random random = new Random(); // VARIABLE OF THE CLASS RANDOM

		// (1)PICKING THE SIX NUMBERS
		for (int idx = 0; idx < lotto.length; idx++) {
			int temp = random.nextInt(45) + 1; // TEMP IS A RANDOM NUBER FROM 1-45
			boolean ok = true; // A BOOLEAN VALUE THAT ONLY STAYS 'TRUE' IF THE NUMBERS ARE NOT REPETATIVE

			// (2) CHECKING FOR EACH NUMBER IF THE NUMBER IS REPETATIVE
			for (int i = 0; i < idx; i++) {
				if (temp == lotto[i]) { // FOR EACH IDX VALUE, IT CHECKS IF ALL THE PREFVIOUS LOTTO VALUES ARE EQUAL TO
										// IT. IF ONE IS EQUAL, IT PICKS AGAIN FROM THE PREVIOUS IDX
					idx--;
					ok = false;
					break;
				}
			}
			if (ok) {
				lotto[idx] = temp;
			}
		} // AT THIS POINT, 6 DIFFERENT LOTTO NUMBERS ARE PICKED

		// (3) ORDERING IN ASCENDING ORDER
		for (int i = 0; i < lotto.length; i++) {
			for (int j = i + 1; j < lotto.length; j++) {
				if (lotto[i] > lotto[j]) { // IF THE NUMBER AT INDEX X IS LARGER THAN THE NUMBER AT INDEX X+1, IT
											// SWITCHES THEIR ORDER AROUND
					int temp = lotto[i];
					lotto[i] = lotto[j];
					lotto[j] = temp;
				}
			}
		}
		for (int numbers : lotto) {
			System.out.print(numbers + " ");
		}
	}
}