package com.lec.ex03_account;

public class AccountTestMain {
	public static void main(String[] args) {
		Account hong = new Account ("100-2", "Unie", 2200000000L);
		Account shin = new Account ("100-1", "Charlie");
		Account acc = new Account ();
		acc.setAccountNo("100-2");
		acc.setOwnerName("Unie");
		System.out.print(hong.infoPrint());
		System.out.print(shin.infoPrint());
		System.out.print(acc.infoPrint());
		shin.deposit(2000);
		shin.withdraw(3000);
		hong.withdraw(20000);
		acc.withdraw(10);
		System.out.print(hong.infoPrint());
		System.out.print(shin.infoPrint());
		System.out.print(acc.infoPrint());
		
	}
}
