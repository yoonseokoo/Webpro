package com.lec.loop;

public class Ex02_doubleFor {
	public static void main(String[] args) {
		for(int j=1 ; j<=5 ; j++) {
			for(int i=1 ; i<=j ; i++) {
				System.out.print('*');
			}
			System.out.println();
		}
	}
}
