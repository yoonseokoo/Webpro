package com.lec.loop;
public class Ex04_break_Continue {
 public static void main(String [] args) {
	 for(int i=1; i<=5; i++) {
		 if(i==3) {
//break: breaks out of the block
			 break;
//continue: stops the block and skips to the increment
		 	}
		 System.out.println(i+". Hello");
	 }
 }
}
