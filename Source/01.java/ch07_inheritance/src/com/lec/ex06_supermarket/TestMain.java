package com.lec.ex06_supermarket;

public class TestMain {
	public static void main(String[] args) {

		Customer customer = new Customer("Unie", " 010-7642-0696", "Milan");
		customer.buy(100000);
		customer.buy(900000);
		System.out.println(customer.infoString());
		Staff staff = new Staff("Charlie", "010-5884-2142", "2022-09-01", "Marketing");
		Person person = new Person("Jimmy", "010-7777-7777");
		Person[] personArr = { customer, staff, person };
		for (int i = 0; i < personArr.length; i++) {
			System.out.println(personArr[i].infoString());
		}
		System.out.println("Extension command for");
		for (Person p : personArr) {
			System.out.println(p.infoString());
		}
		for (Person p : personArr) {
			if (p instanceof Customer) { // is the variable p, a instance of customer?
				((Customer) p).buy(1000);
			} else {
				System.out.println("buying is only avaible for the customers");
			}
		}
	}
}
