package com.lec.condition;

import java.util.Scanner;

public class Ex03_evenOdd {
	public static void main(String [] args) {
		int num = 3;
	//USING IF
			if(num%2 ==0) {
				System.out.print("Even");
			}else {
				System.out.print("Odd");
			}
	//USING SWITCH
		switch(num%2) {
			case 0 : System.out.print("Even"); break;
			default : System.out.print("Odd"); break;
			}
	//Ternary Operator
		System.out.print(num%2==0 ? "Even":"Odd");
	}
}
