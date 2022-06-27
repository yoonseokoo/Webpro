package com.lec.ex09_account;

public class Account {
	private String accountNo;
	private String ownerName;
	private long balance;

	// CONSTRUCTOR
	public Account() {
	}

	public Account(String accountNo, String ownerName) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		System.out.printf("Mr/Ms %s(%s), thank you for making an account. Why haven't you brought money?\n", ownerName,
				accountNo);

	}

	public Account(String accountNo, String ownerName, long balance) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;
		System.out.printf("Mr/Ms %s(%s), thank you for making an account with %d won\n", ownerName, accountNo, balance);
	}

	// METHOD
	public void deposit(int money) { // void = does not return a value
		if (money >= 0) {
			balance += money; // upgrade balance
			System.out.printf("Mr/Ms %s(%s), %d won has been deposited. Current balance: %d\n", ownerName, accountNo,
					money, balance);
		} else {
			System.out.println("You cannot deposit this value");
		}
	}

	public void withdraw(int money) {
		if (money <= balance) {
			balance -= money;
			System.out.printf("Mr/Ms %s(%s), %dwon has been withdrawed. Current balance: %d\n", ownerName, accountNo,
					money, balance);
		} else {
			System.out.println(ownerName + ", your balance is in shortage. Withdrawal is not possible");
		}
	}

	// GETTER & SETTER
	public String infoPrint() {
		return String.format("Mr/Ms %s(%s), your balance : %d won\n", ownerName, accountNo, balance);
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public long getBalance() {
		return balance;
	}

	public void setBalance(long balance) {
		this.balance = balance;
	}
}
