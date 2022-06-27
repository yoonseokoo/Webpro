package com.lec.ex10_MomWallet;

public class ChildTestMain {
	public static void main(String[] args) {
		Child child1 = new Child("First child Anna ");
		Child child2 = new Child("Second child Ben ");
		Child child3 = new Child("Third child Charlie ");
		child1.takeMoney(1000);
		child2.takeMoney(1000);
		child3.takeMoney(1000);
		System.out.println(Child.momWallet.money);
		System.out.println(child1.momWallet.money);
		System.out.println(child2.momWallet.money);
		System.out.println(child3.momWallet.money);
	}
}
