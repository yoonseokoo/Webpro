package com.lec.ex3_readerwriter;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

public class Ex01_Reader {
	public static void main(String[] args) {
		Reader reader = null;
		try {
			reader = new FileReader("txtFile/inTest.txt"); // 1.OPEN FILE
			while (true) { // 2.READ FILE
				int i = reader.read();
				if (i == -1)
					break;
				System.out.print((char) i);
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (reader != null)
					reader.close();
			} catch (Exception e2) {

			}
		}
	}
}