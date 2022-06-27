package com.lec.ex5_employee;

public class SalaryEmployee extends Employee {
//	SalaryEmployee : name, annalSalary, computePay(),computeIncentive()
	private int annualSalary;

	public SalaryEmployee(String name, int annualSalary) {
		super(name);
		this.annualSalary = annualSalary;

	}

	@Override
	public int computePay() {
		return annualSalary / 14;

	}
}
