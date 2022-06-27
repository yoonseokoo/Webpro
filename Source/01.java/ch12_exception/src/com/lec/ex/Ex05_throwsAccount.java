package com.lec.ex;

public class Ex05_throwsAccount {
	private String accountNo;
	private String ownerName;
	private int balance;

	public Ex05_throwsAccount(String accountNo, String ownerName) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
	}

	public Ex05_throwsAccount(String accountNo, String ownerName, int balance) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;
	} // DEPOSIT

	public void deposit(int amount) {
		System.out.println("Current balance : " + this);
		balance += amount;
		System.out.println("After depositing " + amount + "won,  New balance : " + this);
	} // WITHDRAWL

	public void withdraw(int amount) throws Exception {
		if (balance < amount) { // Forcefully throw an exception ion case of shortage on balance
			throw new Exception(balance + "won is in shortage to withdraw " + amount + "won");
		}
		System.out.println("Current balance : " + this);
		balance -= amount;
		System.out.println("After withdrawing " + amount + "won,  New balance : " + this);
	}

	@Override
	public String toString() {
		return "\n[ACCOUNT NO]: " + accountNo + "\t[ACCOUNT OWNER]: " + ownerName + "\t[BALANCE]: " + balance + "\n";
	}
}