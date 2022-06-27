package com.lec.ex3_readerwriter;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

public class Ex03_BufferReader {
	public static void main(String[] args) {
		Reader reader = null;
		BufferedReader br = null;
		try {
			reader = new FileReader("txtFile/inTest.txt"); // 1.CONSTRUCTING
															// MAIN STREAM
			br = new BufferedReader(reader); // SUB-STREAM
			int cnt = 0;
			while (true) {
				String linedata = br.readLine(); // 2.READ DATA, ONE LINE BY
													// LINE
				if (linedata == null)
					break; // WHEN FILE ENDS, BREAK
				System.out.println(++cnt + linedata);
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try { // 3. ÆÄÀÏ ´Ý±â
				if (br != null)
					br.close();
				if (reader != null)
					reader.close();
			} catch (Exception e2) {

			}
		}
	}
}