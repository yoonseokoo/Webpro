package com.lec.ex;

// println() ; new line
// print() ; no new line
// printf() ; give format
public class Ex02_intByteChar {
	public static void main(String[] args) {
		int i = 10; // in a memory storage of 4byte called 'i', allocate 10
		byte j = 10; // in a memory storage of 2byte called 'j', allocate 10
		double h = 10.15;
		i = 5;
		System.out.println("i=" + i + "\t j=" + j + "\t h=" + h);
		char c1 = 'A';
		char c2 = 'B';
		System.out.print("c1=" + c1 + "\t c2=" + c2 + "\n");
		System.out.printf("c1=%c \t c2=%c\n", c1, c2);
		// %c-character, %d-integer, %f-decimal, %s-string
		System.out.printf("i=%d, j=%d, h=%5.1f \n", i, j, h);
	}
}