package com.lec.ex1_inputstreamOut;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

//STEPS:
//1.OPENING FILE
//2.READ FILE (using: read(byte[]) byte[])
//3.CLOSE FILE

public class Ex02_inputStream10Byte {
	public static void main(String[] args) {
		InputStream is = null;
		try {
			is = new FileInputStream("txtFile/inTest.txt"); // 1.OPENING FILE
			byte[] bs = new byte[10]; // CREATING AN ARRAY NAMED BS WITH A
										// LENGTH OF 10 (so that it can read 10
										// bytes at a time)
			while (true) { // 2.READ FILE
				int readByteCount = is.read(bs); // READING 10 BYTE AT A TIME
				if (readByteCount == -1)
					break;
				for (int i = 0; i < readByteCount; i++) {
					System.out.print((char) bs[i]);
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try { // 3.CLOSE FILE
				if (is != null)
					is.close();
			} catch (IOException e) {
			}
		}
	}
}
