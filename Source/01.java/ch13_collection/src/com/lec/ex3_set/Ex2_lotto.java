package com.lec.ex3_set;

import java.util.HashSet;

public class Ex2_lotto {
	public static void main(String[] args) {
		HashSet<Integer> lotto = new HashSet<Integer>();
		int cnt = 0;
		while (lotto.size() < 6) {
			lotto.add((int) ((Math.random() * 45) + 1));
		}
		System.out.println("Numers: " + lotto);
	}
}
