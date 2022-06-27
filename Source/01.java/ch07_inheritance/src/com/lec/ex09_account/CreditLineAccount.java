package com.lec.ex09_account;

public class CreditLineAccount extends CheckingAccount {
	private int creditLine;

	public CreditLineAccount(String accountNo, String ownerName, String cardNo, int creditLine) {
		super(accountNo, ownerName, cardNo);
		this.creditLine = creditLine;
	}

	public CreditLineAccount(String accountNo, String ownerName, long balance, String cardNo, int creditLine) {
		super(accountNo, ownerName, balance, cardNo);
		this.creditLine = creditLine;
	}

	@Override
	public void pay(String cardNo, int amount) {
		if (cardNo.equals(getCardNo())) {
			if (creditLine >= amount) {
				creditLine = creditLine - amount;
				System.out.printf("\nMr/Ms %s(%s), by withdrawing %d, %d of the Credit Line is left", getOwnerName(),
						getAccountNo(), amount, creditLine);

			} else {
				System.out.printf("Mr/Ms %s(%s), with the Credit line at %d, it is not possible to withdraw %d",
						getOwnerName(), getAccountNo(), creditLine, amount);

			}
		} else {
			System.out.println("insert the correct card number");
		}

	}
}
