package com.lec.ex;
//국어, 영어, 수학 점수를 변수에 할당하고 각 점수를 출력하고 총점, 평균(소수점2자리까지) 출력하는 프로그램을 구현 하시오
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
		
