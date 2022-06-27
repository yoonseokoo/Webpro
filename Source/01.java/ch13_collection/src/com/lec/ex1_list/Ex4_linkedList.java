package com.lec.ex1_list;

import java.util.LinkedList;

public class Ex4_linkedList {
	public static void main(String[] args) {
		LinkedList<String> linkedList = new LinkedList<String>();
		// linkedList.add("str0");
		// linkedList.add("str1");
		// linkedList.add("str2");
		// linkedList.add("str3");
		for (int i = 0; i < 11; i++) {
			linkedList.add("str" + i);
		}
		linkedList.set(1, "1111");
		System.out.println(linkedList);
		linkedList.add(1, "ธÞที");
		System.out.println(linkedList);
		linkedList.remove(6);
		System.out.println(linkedList);
		linkedList.clear();
		System.out.println(linkedList);
	}
}
