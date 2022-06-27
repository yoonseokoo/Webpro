package com.lec.ex02_human;

public class TestMain {
	public static void main(String[] args) {
		int i =10; 
		int j =10;
		System.out.println(i==j ? "SAME" : "DIFFERENT");
		
		Woman w1 = new Woman();
		Woman w2 = new Woman();
		
		if (w1.equals(w2)) {
				System.out.println("w1 and w2 are from same objects");
		} else {
			System.out.println("w1 and w2 are different objects");
		}
		Man m1 = new Man(22,165,60.5);
		Man m2 = m1;
		Man m3 = new Man(22,165,65.5);
		
		if(m1.equals(m2)) {
			System.out.println("m1 and m2 are equal"); //EQUAL BECAUSE M2 IS CREATED IN REFERENCE TO M1
		} else {
			System.out.println("m1 and m2 are different");
		}
		if(m1.equals(m3)) {
			System.out.println("m1 and m3 are same objects");
		} else {
			System.out.println("m1 and m3 are different objects"); //EQUAL BECAUSE M1 AND M3 ARE DIFFERENT OBJETCS
		}
		
		m1.setHeight(160);
		m1.setWeight(50.9);
		if(m1.calculateBMI() >30) { //METHOD FOR BMI (FROM CLASS 'MAN')
			System.out.println("Unhealthy");
		} else {
			System.out.println("healthy");
			
		}
	}
}
