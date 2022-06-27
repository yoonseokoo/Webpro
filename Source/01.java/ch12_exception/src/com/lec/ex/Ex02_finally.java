package com.lec.ex;

public class Ex02_finally {
	public static void main(String[] args) {
		int[] arr = { 0, 1, 2 };
		for (int i = 0; i <= arr.length; i++) { // length is 3, but index is up to 2
			try {
				System.out.println("arr[" + i + "] = " + arr[i]); // arr[3] is out of bounds
			} catch (ArrayIndexOutOfBoundsException e) {
				System.out.println("THIS IS OUT OF BOUNDS" + e.getMessage());
			} finally {
				System.out.println("Reaches this point after all 'try' and 'catch'");
			}
		}

	}
}