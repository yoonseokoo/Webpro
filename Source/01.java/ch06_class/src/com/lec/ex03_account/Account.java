package com.lec.ex03_account;

public class Account {

	private String accountNo;
	private String ownerName;
	private long balance;

	public Account() {} //DEFAULT CONSTRUCTOR
	
	public Account(String accountNo, String ownerName) { //CONSTRUCTOR WITH TWO PARAMETERS
		this.accountNo = accountNo;
		this.ownerName = ownerName;
			System.out.printf("Mr/Ms %s(%s), thank you for making an account. Your account is currently empty\n", ownerName, accountNo);
	
			}
	public Account(String accountNo, String ownerName, long balance) { //CONSTRUCTOR WITH THREE PARAMETERS
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;
		System.out.printf("Mr/Ms %s(%s), thank you for making an account. Your current balance is %d won\n", ownerName, accountNo, balance);
	}
	
	//METHOD
	public void deposit(int money) { //VOID: NO RETURN VALUE
		if (money>=0) {
			balance += money;
		} else {
			System.out.println("ERROR");
			}
		}
	public void withdraw (int money) {
		if (money <= balance) {
			balance -=money;
		} else {
			System.out.println("Mr/Ms " + ownerName + ". Withdrawal has failed due to lack of balance");
			}
		}
//getter & setter ½ÃÀÛ 
	public String infoPrint() {
		return String.format ("Mr/Ms %s(%s)'s balance: %d won\n", ownerName, accountNo, balance);
		// return ownerName + "(" + accountNo + ")" + "'s balance: " + balance + " won";
	}
	
	//GETTER & SETTER
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
	public String getBalance() {
		return ownerName;
	}
	public void setBalance(long balance) {
		this.balance = balance;	
	}
}

	

