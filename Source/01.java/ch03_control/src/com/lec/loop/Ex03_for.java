package com.lec.loop;

public class Ex03_for {
	public static void main(String[] args) {
		for(int i=1 ; i<=40 ; i++) {
				System.out.print(i+"\t");
				if(i%4 == 0) { //4�� ����������, remainder �� 0�̸�
					System.out.println();
			}
		}
	}
}