package com.lec.condition;

import java.util.Scanner;

public class Ex02_grades {
	public static void main(String [] args) {
		Scanner scanner = new Scanner(System.in);
			System.out.print("Score: ");
			int score = scanner.nextInt();
			
//			USING SWITCH
			int temp = score==100? score-1: score;
			temp = (-9<=temp && temp<0)? -10 : temp;
			switch(temp / 10) {
				case 9: System.out.println("A"); break;
				case 8: System.out.println("B"); break;
				case 7: System.out.println("C"); break;
				case 6: System.out.println("D"); break;
				case 5: case 4: case 3: case 2: case 1: case 0: 
					System.out.println("F"); break;
				default:
					System.out.println("not a valid number");
				
//			USING IF
//			if( (90 <= score) && (score <= 100)) { 
//				System.out.println("A");
//			}else if (80 <= score && score <90) {
//				System.out.println("B");
//			}else if (70 <= score && score <80) {
//				System.out.println("C");
//			}else if (60 <= score && score <70) {
//				System.out.println("D");
//			}else if (0 <= score && score <60) {
//				System.out.println("F");
//			}else {
//				System.out.println("not a valid number");
//			}
		}
	}
}
