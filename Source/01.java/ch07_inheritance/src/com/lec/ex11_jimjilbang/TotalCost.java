package com.lec.ex11_jimjilbang;

import java.util.Scanner;

import com.lec.ex11_jimjilbang.Jimilbang.Jimjilbang;

public class TotalCost {

	private int totalCost;
	private int massage;
	private int game;
	private int ramen;
	private int chips;
	private int juice;
	private int foodTotCost;
	private int entTotCost;

	public TotalCost() {

	}

	public void foodCost(int ramen, int chips, int juice) {
		this.ramen = ramen;
		this.chips = chips;
		this.juice = juice;
		foodTotCost = ramen * Constant.RAMENPRICE + chips * Constant.CHIPSPRICE + juice * Constant.JUICEPRICE;

	}

	public void foodCost() {
		System.out.println("FOOD: ");
		Scanner scanner = new Scanner(System.in);
		System.out.print("how many ramen have you eaten?: ");
		ramen = scanner.nextInt();
		System.out.print("how many bags of chips have you eaten?: ");
		chips = scanner.nextInt();
		System.out.print("how many cups of juices did you consume?: ");
		juice = scanner.nextInt();
		foodCost(ramen, chips, juice);

	}

	public void entCost(int massage, int game) {
		this.massage = massage;
		this.game = game;
		entTotCost = massage * Constant.MASSAGEPRICE + game * Constant.GAMEPRICE;
	}

	public void entCost() {
		System.out.println("\nENTERTAINMENT: ");
		Scanner scanner = new Scanner(System.in);
		System.out.println("How many massages have you received?: ");
		massage = scanner.nextInt();
		System.out.println("How many games have you played?: ");
		game = scanner.nextInt();
		entCost(massage, game);

	}

	public void totalCost(int outTime) {
		totalCost = (outTime - Jimjilbang.inTime) / 100 * Constant.HOURLYRATE;
		int sum = entTotCost + totalCost + foodTotCost;
		System.out.println("[In Time]: " + Jimjilbang.inTime);
		System.out.println("[Out Time]: " + outTime);
		System.out.println("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.printf(
				"\t\tReceipt\n\n[Ramen]: %d*%d = %d\n[CHIPS]: %d*%d = %d\n[JUICE]: %d*%d = %d\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n[MASSAGE]: %d*%d = %d\n[GAME]: %d*%d = %d\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n[TOTAL FOOD COST]: %d\n[TOTAL FUN COST]: %d\n"
						+ "[HOURLY FEE]: %d\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n[TOTAL COST]: %d\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
				ramen, Constant.RAMENPRICE, ramen * Constant.RAMENPRICE, chips, Constant.CHIPSPRICE,
				chips * Constant.CHIPSPRICE, juice, Constant.JUICEPRICE, juice * Constant.JUICEPRICE, massage,
				Constant.MASSAGEPRICE, massage * Constant.MASSAGEPRICE, game, Constant.GAMEPRICE,
				game * Constant.GAMEPRICE, foodTotCost, entTotCost, totalCost, sum);
	}

	public void totalCost() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("\nWhat time are you leaving?: ");
		int outTime = scanner.nextInt();
		totalCost(outTime);

	}

	public int getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}

}
