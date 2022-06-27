package com.lec.ex1_inputstreamOut;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

//STEPS:
//1.OPENING FILE (Generating object for a printing stream)
//2.WRITE IN TO FILE
//3.CLOSE FILE (streamObject.close)

public class Ex04_outputStream {
	public static void main(String[] args) {
		OutputStream os = null;
		try {
			os = new FileOutputStream("txtFile/outTest.txt", true);
			String str = "Unie's\npractice String?";
			byte[] bs = str.getBytes(); // CONVERTING A STRING TO A BYTE ARRAY
			os.write(bs); // PRINTS IN SPECIFIED FILE
			System.out.println("Successfully printed file");// PRINTED IN
															// CONSOLE
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try { // (3)
				if (os != null)
					os.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}