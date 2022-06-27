package com.lec.ex5_ExampleATM;

public class ATM_Target implements Runnable {
	private boolean flag;
	private ATM card;

	public ATM_Target(ATM card) {
		this.card = card;
	}

	@Override
	public void run() {
		for (int i = 0; i < 10; i++) {
			if (flag) { // if flag is true = withdraw
				card.withdraw(1000, Thread.currentThread().getName());
				flag = false;
			} else {
				card.deposit(1000, Thread.currentThread().getName());
				flag = true;
			}

		}

	}

}
