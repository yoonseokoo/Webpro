package com.lec.ex09_account;

public class CheckingAccount extends Account {
	private String cardNo;

	public CheckingAccount(String accountNo, String ownerName, String cardNo) {
		super(accountNo, ownerName);
		this.cardNo = cardNo;
		System.out.printf("Mr/Ms %s(%s), thank you for making an account. Why haven't you brought money?\n", ownerName,
				accountNo);
	}

	public CheckingAccount(String accountNo, String ownerName, long balance, String cardNo) {
		super(accountNo, ownerName, balance);
		this.cardNo = cardNo;

	}

	public void pay(String cardNo, int amount) {
		if (this.cardNo.equals(cardNo)) {
			if (getBalance() >= amount) {
				setBalance(getBalance() - amount);
				System.out.printf("\nMr/Ms %s(%s), by withdrawing %d, the current balance: %d", getOwnerName(),
						getAccountNo(), amount, getBalance());

			} else {
				System.out.printf("Mr/Ms %s(%s), with the balance at %d, it is not possible to withdraw %d",
						getOwnerName(), getAccountNo(), getBalance(), amount);

			}
		} else {
			System.out.println("insert the correct card number");
		}
	}

	public String getCardNo() {
		return cardNo;
	}

}
