package com.lec.ex;

//���̸� �Է¹޾� �Է¹��� ���̰� 65�� �̻��� ��, ����ο�롱 ���, �ƴϸ� ���Ϲݡ����
import java.util.Scanner;

public class Ex05_boolean {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Insert your age: ");
		int n1 = 65;
		int age = scanner.nextInt(); // ����ڷκ��� ���� �Է� �ޱ�
		boolean result;
		if (result = age >= 65)
			System.out.print("Elderly");
		else
			System.out.printf("Normal");
		scanner.close();
	}
}
