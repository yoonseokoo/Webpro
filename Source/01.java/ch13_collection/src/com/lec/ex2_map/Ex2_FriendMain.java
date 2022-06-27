package com.lec.ex2_map;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

public class Ex2_FriendMain {
	public static void main(String[] args) {
		HashMap<String, Ex2_Friend> friends = new HashMap<String, Ex2_Friend>();
		friends.put("A", new Ex2_Friend("A", "010-1111-2222"));
		friends.put("B", new Ex2_Friend("B", "010-2222-3333"));
		friends.put("C", new Ex2_Friend("C", "010-3333-4444"));
		friends.put("D", new Ex2_Friend("D", "010-5555-6666"));
		friends.put("E", new Ex2_Friend("E", "010-6666-7777", new Date(2000, 7, 8)));

		Iterator<String> iterator = friends.keySet().iterator();
		System.out.println();
		while (iterator.hasNext()) {
			String key = iterator.next();
			System.out.println("Friend " + key + " is " + friends.get(key));
		}

	}
}
