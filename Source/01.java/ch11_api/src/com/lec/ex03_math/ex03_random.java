package com.lec.ex03_math;

import java.util.Random;

public class ex03_random {
	public static void main(String[] args) {
		System.out.println("0~ 45�̸��� double ���� : " + Math.random() * 45);
		System.out.println("0~ 45�̸��� ���� ���� : " + (int) (Math.random() * 45));
		System.out.println("�ζ� ��ȣ �̱� : " + ((int) (Math.random() * 45) + 1));

		Random random = new Random();
		System.out.println("int ���� : " + random.nextInt());
		System.out.println("double ���� : " + random.nextDouble());
		System.out.println("T/F �� �ϳ� ���� : " + random.nextBoolean());
		System.out.println("0~44������ ���� ���� : " + random.nextInt(45));
		System.out.println("�ζ� ��ȣ �̱� : " + (random.nextInt(45) + 1));
	}
}
