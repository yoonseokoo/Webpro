package com.lec.ex10_MomWallet;

public class Child {
	private String name;
	static MomWallet momWallet;

	public Child() {
	} // CONSTRUCTOR

	public Child(String name) { // CONSTRUCTOR WITH ONE PARAMETER
		this.name = name;
		momWallet = new MomWallet();
	}

	public void takeMoney(int money) { // METHOD 'TAKE MONEY'
		if (momWallet.money >= money) {
			momWallet.money -= money;
			System.out.println(
					name + "has taken " + money + " won from me, leaving " + momWallet.money + " in my wallet");
		} else {
			System.out.println(
					name + "failed to receive money. The wallet currently contains " + momWallet.money + " won");
		}
	}
}
