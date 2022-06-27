package com.lec.condition;

import java.util.Scanner;

public class Ex04_grades2 {


public static void main(String[] args) {
	double kor, eng, math;
	Scanner sc = new Scanner(System.in);
	System.out.print("Korean score is: ");
	kor = sc.nextDouble(); 
	System.out.print("English score is: ");
	eng = sc.nextDouble();
	System.out.print("Mathematics score is: ");
	math = sc.nextDouble();
	int sum = (int)kor + (int)eng + (int)math;
	double avg = sum / 3.0;
	System.out.printf("avg is %4.2f \n", avg);
	
	if (kor > avg) {
		System.out.println("Korean score is higher than the average");
	}else {
		System.out.println("Korean score is lower than the average");
	}if (eng > avg) {
			System.out.println("English score is higher than the average");
	}else {
			System.out.println("English score is lower than the average");
	}if (math > avg) {
			System.out.println("Mathematics score is higher than the average");
	}else {
			System.out.println("Mathematics score is lower than the average");
	}
	
sc.close();
}
}
	

