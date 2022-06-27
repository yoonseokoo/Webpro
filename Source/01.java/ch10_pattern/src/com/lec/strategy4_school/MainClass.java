package com.lec.strategy4_school;

public class MainClass {
	public static void main(String[] args) {
		Student st1 = new Student("30301", "���л�", "��ȭ��");
		Student st2 = new Student("30302", "������", "Java��");
		Lecturer gs1 = new Lecturer("J01", "ȫ����", "java");
		Lecturer gs2 = new Lecturer("J02", "�����", "db");
		Staff s = new Staff("A01", "������", "�������");

		Person[] person = {st1, st2, gs1, gs2, s};

		System.out.println("\nWe should work during working hours");
		for (int idx = 0; idx < person.length; idx++) {
			System.out.print("Person " + (idx + 1) + ": ");
			person[idx].positionJob();
		}

		System.out.println("\nWill be given at the end of the month");
		for (int idx = 0; idx < person.length; idx++) {
			System.out.print("Person " + (idx + 1) + ": ");
			person[idx].positionGet();

		}

		System.out.println("\nIf curious, print");
		for (int idx = 0; idx < person.length; idx++) {
			System.out.print("Person " + (idx + 1) + ": ");
			person[idx].print();
		}
	}
}
