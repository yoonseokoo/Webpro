package com.lec.ex02_date;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.lec.ex01_string.Ex08_FriendClass;

public class Ex06_FriendSimplDateFormat {
	public static void main(String[] args) {
		Ex08_FriendClass[] friends = { new Ex08_FriendClass("Unie", "010-9999-9999", "04-28"),
				new Ex08_FriendClass("Charlie", "010-8888-8888", "02-28"),
				new Ex08_FriendClass("Jimmy", "010-7777-7777", "05-28") };

		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		String todayStr = sdf.format(today);
		boolean searchOk = false;

		for (Ex08_FriendClass friend : friends) {
			String birthday = friend.getBirthday(); // get birthday value
			if (birthday.equals(todayStr)) {
				System.out.println(friend);
				searchOk = true;
			}
		}
		if (!searchOk) {
			System.out.println("Nobody's birthday is today");
		}
	}
}