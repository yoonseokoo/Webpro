package com.lec.ex;

public class Ex01_array {

	public static void main(String[] args) {
		int i;

//DECLARE AN EMPTY ARRAY AND IMMEDIATELY PUT IN: 10, 20, 30, 40, 50
		int[] iArr = { 10, 20, 30, 40, 50 };
		iArr[2] = 300;
		for (i = 0; i < iArr.length; i++) {
			System.out.println("iArr[" + i + "] = " + iArr[i]);

		}
		for (int temp : iArr) {
			System.out.println(temp);

		}
//	CREATE EMPTY ARRAY WITH A LENGTH OF 5
		int[] iArr2 = new int[5];
//	int[] iArr2;
//	iArr2 = new int[5];
		for (i = 0; i < iArr2.length; i++) {
			System.out.println("iArr2[" + i + "] = " + iArr2[i]);
		}
	}
}