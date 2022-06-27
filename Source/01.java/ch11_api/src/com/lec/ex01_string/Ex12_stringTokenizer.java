package com.lec.ex01_string;

import java.util.StringTokenizer;

public class Ex12_stringTokenizer {
	public static void main(String[] args) {
		String str1 = "A B C D E";
		StringTokenizer tokenizer1 = new StringTokenizer(str1); // divide String by space
		System.out.println("Number of tokens for tokenizer2: " + tokenizer1.countTokens());
		while (tokenizer1.hasMoreTokens()) {
			System.out.println(tokenizer1.nextToken());
		}
		String str2 = "2022/03/28";
		StringTokenizer tokenizer2 = new StringTokenizer(str2, "/"); // divide string by "/"
		System.out.println("Number of tokens for tokenizer2: " + tokenizer2.countTokens());
		while (tokenizer2.hasMoreTokens()) {
			System.out.println(tokenizer2.nextToken());
		}
	}
}
