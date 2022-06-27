package com.lec.ex2_datastreaming;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

public class MemberPrint {
	public static void main(String[] args) {
		InputStream fis = null;
		DataInputStream dis = null;
		ArrayList<Member> members = new ArrayList<Member>();
		try {
			fis = new FileInputStream("src/com/lec/ex2_datastreaming/Member.data");
			dis = new DataInputStream(fis);
			while (true) {
				String name = dis.readUTF();
				int age = dis.readInt();
				String nationality = dis.readUTF();
				members.add(new Member(name, age, nationality));
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println("Inventories are as follows");
			if (members.isEmpty()) {
				System.out.println("Empty Storage");
			} else {
				for (Member m : members) {
					System.out.println(m);
				}
				System.out.println("Number of members: " + members.size());
			}
		} finally {
			try {
				if (dis != null)
					dis.close();
				if (fis != null)
					fis.close();
			} catch (Exception e2) {
			}
		}
	}
}