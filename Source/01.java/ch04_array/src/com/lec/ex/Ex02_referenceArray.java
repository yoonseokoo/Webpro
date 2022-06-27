package com.lec.ex;

public class Ex02_referenceArray {

	public static void main(String[] args) {
		int i = 10;
		int j = 10;
		j = 99;
		System.out.printf("i=%d, j=%d\n", i, j);
		int[] score = { 100, 10, 20, 30, 40 };
		int[] s = score; // score will adopt values in s
		s[0] = 89;
		s[3] = 22;
		for (int idx = 0; idx < score.length; idx++) {
			System.out.printf("Score[%d]=%d\t s[%d]=%d\n", idx, score[idx], idx, s[idx]);
		}

	}

}
