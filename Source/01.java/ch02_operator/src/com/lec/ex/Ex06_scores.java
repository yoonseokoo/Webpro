package com.lec.ex;
//����, ����, ���� ������ ������ �Ҵ��ϰ� �� ������ ����ϰ� ����, ���(�Ҽ���2�ڸ�����) ����ϴ� ���α׷��� ���� �Ͻÿ�
import java.util.Scanner;

public class Ex06_scores {
	public static void main(String[] args) {
		int Kor = 88;
		int Math = 93;
		int Eng = 90;
		int sum = Kor + Math + Eng;
		double avg = sum / 3.0;
		System.out.printf("Korean score is %d, Mathematics score is %d, English score is %d .\n", Kor, Math,
				Eng);
		System.out.printf("sum is %d. avg is %5.2f", sum, avg);
	}
}
		
