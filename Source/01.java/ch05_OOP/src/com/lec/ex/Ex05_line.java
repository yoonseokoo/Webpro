package com.lec.ex;

public class Ex05_line {
	public static void main(String[] args) {
		printLine('бс', 40); // METHOD 1
		System.out.println("Hello World!");
		printLine(40); // METHOD 2
		System.out.println("Hello Java!");
		printLine(); // METHOD 3
		System.out.println("Hello Java!");
		printLine('бс', 40); // METHOD 4
	}

//METHOD 1
	private static void printLine(char c) {
		for (int i = 0; i < 40; i++) {
			System.out.print(c);
		}
		System.out.println();
	}

//METHOD 2
	private static void printLine(int cnt) {
		for (int i = 0; i < cnt; i++) {
			System.out.print("-");
		}
		System.out.println();
	}

//METHOD 3
	private static void printLine() {
		for (int i = 0; i < 40; i++) {
			System.out.print("-");
		}
		System.out.println();
	}

//METHOD 4
	private static void printLine(char c, int cnt) {
		for (int i = 0; i < 40; i++) {
			System.out.print(c);
		}
		System.out.println();
	}
}
