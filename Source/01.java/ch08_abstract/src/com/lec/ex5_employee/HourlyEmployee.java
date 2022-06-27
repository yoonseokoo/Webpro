package com.lec.ex5_employee;

public class HourlyEmployee extends Employee {
//	HourlyEmployee : name, hoursWorked, moneyPerHour, computePay(),computeIncentive()
	private int hoursWorked;
	private int moneyPerHour;

	public HourlyEmployee(String name, int hoursWorked, int moneyPerHour) {
		super(name);
		this.hoursWorked = hoursWorked;
		this.moneyPerHour = moneyPerHour;
	}

	@Override
	public int computePay() {
		return (hoursWorked * moneyPerHour);

	}

}
