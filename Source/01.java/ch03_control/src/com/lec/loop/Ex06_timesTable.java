package com.lec.loop;

public class Ex06_timesTable {
	public static void main(String[] args) {
	for(int i=1 ; i<10 ; i++) { //1���� 9�ܱ���
		for(int j=2 ; j<10 ; j++) { //2���� 9�ܱ���
		System.out.printf("%d * %d = %d\t", j, i, j*i);
		}
	System.out.println();
		}
	}
}
