package com.lec.ex01_string;

import java.util.Scanner;

public class Ex08_FriendSearchTestMain {
	public static void main(String[] args) {
		Ex08_FriendClass[] friends = { new Ex08_FriendClass("Amy", "010-9999-9999", "05-22"), new Ex08_FriendClass("Ben", "010-8888-8888", "03-28"),
				new Ex08_FriendClass("Carl", "010-8888-9999", "08-22"), new Ex08_FriendClass("Dan", "010-7777-7777", "04-22"),
				new Ex08_FriendClass("Eddy", "010-6666-7777", "03-22") };
		Scanner sc = new Scanner(System.in);
		while (true) {
			System.out.print("Last for digits of the number you want to find ?");
			String searchTel = sc.next();
			if (searchTel.equals("x"))
				break;
			boolean searchOk = false;
			for (int idx = 0; idx < friends.length; idx++) {

				String tel = friends[idx].getPhone();
				String post = tel.substring(tel.lastIndexOf('-') + 1);

				if (post.equals(searchTel)) {
					System.out.println(friends[idx]);
					searchOk = true;
				}
			}
			if (!searchOk) {
				System.out.println("Cannot find friend");
			}
		}
		sc.close();
	}
}
