package com.lec.ex1_inputstreamOut;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

//STEPS:
//1. STREAM OJBECT (FOR INPUTE AND OUTPUT
//2. READ AND WRITE
//3. CLOSE FILE(streamObject.close)

public class Ex05_filecopy {
	public static void main(String[] args) {
		InputStream is = null;
		OutputStream os = null;
		try {
			File file = new File("C:\\Users\\user\\Desktop\\Unie\\Webpro\\son.jpg"); // (1)
			is = new FileInputStream("C:\\Users\\user\\Desktop\\Unie\\Webpro\\son.jpg"); // LOCATION OF WHERE THE
																							// PROGRAM WILL READ FROM
			os = new FileOutputStream("C:\\Users\\user\\Desktop\\Unie\\Webpro\\son_copyed.jpg"); // LOCATION OF WHERE
																									// THE PROGRAM WITH
																									// PRINT TO
			int cnt = 0;
			byte[] bs = new byte[(int) file.length()]; // READS FILE (1)'S LENGTH
			while (true) { // (2)
				int readByteCount = is.read(bs); // SET BYTE ARRAY LENGTH
													// ACCORDING TO FILE SIZE
				if (readByteCount == -1)
					break;
				os.write(bs, 0, readByteCount);// WRITE BS, readBytecount TIMES
				cnt++;
			}
			System.out.println("while command has been repeated " + cnt + " times to copy the file");
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (os != null)
					os.close(); // (3)
				if (is != null)
					is.close(); // (3)
			} catch (IOException e) {

			}
		}
	}
}