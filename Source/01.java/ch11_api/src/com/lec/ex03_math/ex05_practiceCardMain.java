package com.lec.ex03_math;

import java.util.Random;

public class ex05_practiceCardMain {
	public static void main(String[] args) {
		ex05_practiceCardClass[] cards = { new ex05_practiceCardClass('¢À', 1), new ex05_practiceCardClass('¡ß', 2), new ex05_practiceCardClass('¡ß', 3),
				new ex05_practiceCardClass('¡ß', 4) };
		for (ex05_practiceCardClass card : cards) {
			System.out.println(card);
		}
		Random random = new Random();
		char[] kinds = { '¢¼', '¡ß', '¢À', '¢¾' };
		ex05_practiceCardClass comCard = new ex05_practiceCardClass(kinds[random.nextInt(4)], random.nextInt(13) + 1);
		System.out.println("Card randomly chosen by computer : " + comCard);
		for (int idx = 0; idx < cards.length; idx++) {
			if (cards[idx].equals(comCard)) {
				System.out.println("equal to car no " + idx);
			} else {
				System.out.println("equal to car no " + idx);
			}
		}
	}
}
