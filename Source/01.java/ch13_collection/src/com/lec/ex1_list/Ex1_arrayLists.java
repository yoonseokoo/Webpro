package com.lec.ex1_list;

import java.util.ArrayList; //array: static ; arrayList: dynamic

public class Ex1_arrayLists {
	public static void main(String[] args) {
		System.out.println("¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á Array ¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á");
		String[] array = new String[4];
		array[0] = "str0";
		array[1] = "str1";
		array[2] = "str2";
		for (int i = 0; i < array.length; i++) {
			System.out.printf("\narray[%d] = %s\t", i, array[i]);
		}
		System.out.println("\n¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á Array List ¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á");
		ArrayList<String> arrayList = new ArrayList<String>();
		arrayList.add("str0");
		arrayList.add("str1");
		arrayList.add("str2");
		System.out.println(arrayList.toString());
		arrayList.add(1, "str111111111111");// set index 1 as str111111111111
		System.out.println(arrayList);
		arrayList.set(1, "11111"); // set index 1 as 11111
		System.out.println(arrayList);
		for (String alist : arrayList) {
			System.out.print(alist + "\t");
		}
		System.out.println("\n - After removal");
		arrayList.remove(1);
		arrayList.remove(arrayList.size() - 1);
		for (int idx = 0; idx < arrayList.size(); idx++) {
			System.out.printf("\n%dth index value is %s\t", idx, arrayList.get(idx));
		}
		System.out.println("\n¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á Array List clear ¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á");
		System.out.println();
		arrayList.clear();
		if (arrayList.size() == 0) {
			System.out.println("array List does not have data");
		}
		if (arrayList.isEmpty()) {
			System.out.println("array List does not have data");
		}
		System.out.println(arrayList);
		arrayList = null; // deleting the object "arrayList"
		System.out.println(arrayList);
	}

}