package com.lec.ex2_datastreaming;

import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Scanner;

public class MemberWriter {
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		String answer;
		OutputStream fos = null; // FILE OUTPUT STREAM
		DataOutputStream dos = null; // DATA OUTPUT STREAM

		try {
			fos = new FileOutputStream("src/com/lec/ex2_datastreaming/Member.data", true);
			dos = new DataOutputStream(fos);

			while (true) {
				System.out.println("Do you have more members to add? (Y/N)");
				answer = sc.next();
				if (answer.equalsIgnoreCase("n")) {
					break;
				} else if (answer.equalsIgnoreCase("y")) {
					System.out.println("Member Name?");
					dos.writeUTF(sc.next());
					System.out.println("Member Age?");
					dos.writeInt(sc.nextInt());
					System.out.println("Member Nationality?");
					dos.writeUTF(sc.next());
				}
			}
			System.out.println("END");
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (dos != null)
					dos.close();
				if (fos != null)
					fos.close();
			} catch (Exception e2) {

			}
		}
	}
}
