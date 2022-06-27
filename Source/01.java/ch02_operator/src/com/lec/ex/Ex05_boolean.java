package com.lec.ex;

//나이를 입력받아 입력받은 나이가 65세 이상일 때, “경로우대” 출력, 아니면 “일반”출력
import java.util.Scanner;

public class Ex05_boolean {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Insert your age: ");
		int n1 = 65;
		int age = scanner.nextInt(); // 사용자로부터 정수 입력 받기
		boolean result;
		if (result = age >= 65)
			System.out.print("Elderly");
		else
			System.out.printf("Normal");
		scanner.close();
	}
}
