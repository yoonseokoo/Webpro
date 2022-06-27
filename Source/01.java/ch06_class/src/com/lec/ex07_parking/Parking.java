package com.lec.ex07_parking;

import java.util.Scanner;
import com.lec.cons.Constant;

public class Parking {
	private String carNum;
	private int inTime;
	private int cost;
	private int outTime;
	public Parking () {} //CONSTRUCTOR
	public Parking (String carNum, int inTime) { //CONSTRUCTOR WITH 2 PARAMETERS
		this.carNum = carNum;
		this.inTime = inTime;
	}
	public void print (int outTime) { // METHOD OUT-TIME
		this.outTime = outTime;
		cost = (outTime-inTime)*Constant.HOURLYPARKINGRATE; //SEE CLASS 'CONSTANT'
		System.out.println ("Incoming car: \"" + carNum + "\", WELCOME" 
							+ "\n" + "In-Time: " + inTime + ":00\n\n" 
							+ "Exit Car: \"" + carNum + "\", BYE\n" 
							+ "In-Time: " + inTime + ":00" 
							+ "\nOut-Time: " + outTime + ":00\n" 
							+ "Parking cost: " + cost +" won");
	}
	public void print() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("You have entered at " + inTime+ ":00, What time are you leaving?");
		outTime = scanner.nextInt();
		print(outTime);
		scanner.close();
	}
}
