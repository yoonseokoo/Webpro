package com.lec.ex;

//USING FOR
public class Ex03_arrayCopy {
	public static void main(String[] args) {
		int i;

		// Original
		int[] score = { 100, 10, 20, 30, 40 };

		// Copying using arrayCopy
		int[] scoreCopy1 = new int[score.length];
		System.arraycopy(score, 0, scoreCopy1, 0, score.length);

		// Copying using 'for' command
		int[] scoreCopy2 = new int[score.length];
		for (i = 0; i < score.length; i++) {
			scoreCopy2[i] = score[i];
		}
		scoreCopy1[0] = 999;
		scoreCopy2[0] = 777;
		for (i = 0; i < 5; i++) {
			System.out.printf("score[%d]=%d\t scoreCopy1[%d]=%d\tscoreCopy2[%d]=%d\n", i, score[i], i, scoreCopy1[i], i,
					scoreCopy2[i]);
		}
	}
}
