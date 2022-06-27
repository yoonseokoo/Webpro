package com.lec.ex2_map;

import java.util.HashMap;
import java.util.Iterator;

public class Ex1_HashMap {
	public static void main(String[] args) {
		HashMap<Integer, String> hashmap = new HashMap<Integer, String>();
		hashmap.put(11, "str11"); // no order
		hashmap.put(20, "str20");
		hashmap.put(8, "str8");
		System.out.println(hashmap.get(20));
		System.out.println("Pre-removal: " + hashmap);
		hashmap.remove(8);
		System.out.println("Post-removal: " + hashmap);
		hashmap.clear();
		System.out.println(
				hashmap.isEmpty() ? "Data deleted" : "data in existence");
		hashmap.put(0, "Kim");
		hashmap.put(1, "Lee");
		hashmap.put(2, "Park");
		hashmap.put(3, "Sung");
		System.out.println(hashmap);
		Iterator<Integer> iterator = hashmap.keySet().iterator();
		System.out.println();
		while (iterator.hasNext()) {
			Integer key = iterator.next();
			System.out.println("data of " + key + " is " + hashmap.get(key));
		}
	}

}