package com.lec.ch02.ex2_bmi;
import lombok.Data;
@Data
public class BMICalculator {
	private double lowWeight;
	private double normal;
	private double overWeight;
	private double obesity;
	public void bmiCalculation(double weight, double height) {//60 170 60/(1.7*1.7)
		double h = height*0.01;
		double result = weight / (h*h);
		System.out.println("BMI 지수 : " + result);
		if(result>obesity) {
			System.out.println("비만입니다");
		}else if(result >overWeight) {
			System.out.println("과체중입니다");
		}else if(result > normal) {
			System.out.println("정상체중입니다");
		}else if(result > lowWeight) {
			System.out.println("저체중입니다");
		}else {
			System.out.println("심각합니다. 살 좀 찌세요");
		}
	}
}





