package com.lec.loop;
//1~100 ���� 3�� ����� �ո� ������ �����?
public class Ex05_while_doWhile {
	public static void main(String[] args) {
		int sum = 0;
		int i=0;
// USING 'WHILE'
		while(i<101) {
			if(i%3==0) {
			sum+=i;
		}
		++i;
	}
// USING 'FOR'
//		for(i=1 ; i<101 ; i++) {
//			if(i%3 ==0) {
//				sum += i;
//			}
//		}
// USING 'DO-WHILE'
//		do {
//			if(i%3==0) {
//				sum+=i; }
//			i++;
//		} while(i<101);
		
		

	System.out.println( "cumulative sum of multiples of 3 is "+sum);
		}
	}
