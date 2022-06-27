package com.lec.ex1_list;

import java.util.ArrayList;
import java.util.Scanner;

public class Ex2_FriendMain {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		ArrayList<Ex2_Friend> friendList = new ArrayList<Ex2_Friend>();
		friendList.add(new Ex2_Friend("A", "010-1111-2222"));
		friendList.add(new Ex2_Friend("B", "010-2222-3333"));

		String fn;
		do {
			System.out.println("Would you like to add a friend? [Y/N]");
			fn = scanner.next();
			if (fn.equalsIgnoreCase("n")) {
				break;
			} else if (fn.equalsIgnoreCase("y")) {
				System.out.println("Insert Name: ");
				String name = scanner.next();

				System.out.println("Insert phone number: ");
				String tel = scanner.next();

				System.out.println("Insert birthday: ");
				String birth = scanner.next();

				System.out.print("Insert address: ");
				scanner.nextLine();
				String address = scanner.nextLine();

				friendList.add(new Ex2_Friend(name, tel, birth, address));
			}
		} while (true);

		if (friendList.isEmpty()) {
			System.out.println("No friends have registered");
		} else {
			System.out.print("[FRIEND LIST]\n");
			System.out.println(friendList);
			scanner.close();
		}
	}
}
