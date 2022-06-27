package com.lec.loop;

public class Ex03_for {
	public static void main(String[] args) {
		for(int i=1 ; i<=40 ; i++) {
				System.out.print(i+"\t");
				if(i%4 == 0) { //4로 나누었을때, remainder 가 0이면
					System.out.println();
			}
		}
	}
}