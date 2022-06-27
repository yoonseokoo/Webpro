package com.lec.ex08_decimalformat;

import java.text.DecimalFormat;

public class Ex01 {
	public static void main(String[] args) {
		double num = 12300000000000L; // 1.23 * (10^13)
		DecimalFormat df0 = new DecimalFormat("00000000");// 12300000000000
		System.out.println(df0.format(num));
		DecimalFormat df1 = new DecimalFormat("########");// 12300000000000
		System.out.println(df1.format(num));
		DecimalFormat df2 = new DecimalFormat("0,000.000");// 12,300,000,000,000.000
		System.out.println(df2.format(num));
		DecimalFormat df3 = new DecimalFormat("#,###.##%");// 1,230,000,000,000,000%
		System.out.println(df3.format(num));
		DecimalFormat df4 = new DecimalFormat("#.##E00");// 1.23E13
		System.out.println(df4.format(num));
	}
}
