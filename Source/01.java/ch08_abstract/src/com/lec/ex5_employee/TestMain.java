package com.lec.ex5_employee;

public class TestMain {
	public static void main(String[] args) {
		Employee[] sawon = { new SalaryEmployee("ȫ�浿", 24000000), new SalaryEmployee("������", 70000000),
				new SalaryEmployee("�����", 12000000), new HourlyEmployee("ȫ�汸", 100, 7000),
				new HourlyEmployee("�����", 120, 8000) };
		for (Employee temp : sawon) {
			System.out.println("\n~ ~ ~ ���޸��� ~ ~ ~");
			System.out.println("�� �� :" + temp.getName());
			System.out.println("�� �� : " + temp.computePay());
			// System.out.println("�� �� : "+ temp.computeIncentive());
			int tempIncen = temp.computeIncentive();
			if (tempIncen != 0) {
				System.out.println("�� �� :" + tempIncen);
			}
		}
	}

}
