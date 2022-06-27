package com.lec.ex5_employee;

public abstract class Employee {

//	Employee : name, computePay(),computeIncentive()
	public String name;

	public Employee(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public abstract int computePay();

	public final int computeIncentive() {

		if (computePay() >= 2000000) {
			return (int) (computePay() * 0.1);
		}
		return 0;
	}
}
