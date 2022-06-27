package com.lec.ex1_inputstreamOut;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

//STEPS:
//1.OPENING FILE
//2.READ FILE 
//3.CLOSE FILE

public class Ex01_InputStream {
	public static void main(String[] args) {
		InputStream is = null;
		try {
			is = new FileInputStream("txtFile/inTest.txt"); // 1.OPENING FILE
			while (true) { // 2.READ DATA
				int i = is.read(); // READ 1 BYTE AT A TIME
				if (i == -1)
					break; // IF IT REACHES THE END OF THE DATA, BREAK
				System.out.print((char) i + "(" + i + ")");
			}

			System.out.println("\nEND");
		} catch (FileNotFoundException e) {
			System.out.println("파일을 못 찾은 경우 예외 : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("파일을 못 읽는 경우 예외 : " + e.getMessage());
		}

		finally {
			try {// 3.CLOSE FILE
				if (is != null)
					is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
