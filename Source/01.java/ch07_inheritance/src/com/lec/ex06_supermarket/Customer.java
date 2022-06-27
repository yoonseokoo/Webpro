package com.lec.ex06_supermarket;

public class Customer extends Person {
	private String address;
	private int sum;
	private int point;
	private boolean vip; // if true, VIP. if false, normal

	public Customer(String name, String tel, String address) {
		super(name, tel);
		this.address = address;
		point = 1000; // new customers automatically have 1000 points
		System.out.println(name + ", thank you. You now have 1000 points as a gift");
	}

	public void buy(int price) {
		sum += price;
		int tempPoint = (int) (price * 0.05);
		point += tempPoint;
		System.out.println(getName() + ", thank you for your purchase. Your point has increased by " + tempPoint
				+ ". Your current cumulative point amount is " + point);
		if (sum >= 1000000 && vip == false) {
			vip = true;
			System.out.println(getName() + ", you have been upgraded to a VIP customer; congratulations!");
		}
	}

	@Override
	public String infoString() {
		return super.infoString() + " [Address]: " + address + " [Point]: " + point + "[Cumulative points]: " + sum;

	}
}
