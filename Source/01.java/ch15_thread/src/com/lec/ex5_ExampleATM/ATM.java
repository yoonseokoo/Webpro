package com.lec.ex5_ExampleATM;

public class ATM {
	private int balance;

	public ATM(int balance) { // constructor with one parameter
		this.balance = balance;

	}

	public synchronized void deposit(int amount, String who) {
		System.out.println("\n" + who + " starting depositing");
		balance += amount;
		System.out.println(who + ", deposited " + amount + ". \nBalance is " + balance);
		System.out.println(who + " ended deposit process");
	}

	public synchronized void withdraw(int amount, String who) {
		System.out.println("\n" + who + " starting withdrawing");
		balance -= amount;
		System.out.println(who + ", withdrew " + amount + ".\nBalance is " + balance);
		System.out.println(who + " ended withdrawing process");
	}
}
