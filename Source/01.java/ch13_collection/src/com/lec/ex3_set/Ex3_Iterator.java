package com.lec.ex3_set;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

public class Ex3_Iterator {
	public static void main(String[] args) {
		//[1] ARRAY LIST
		ArrayList<String> list = new ArrayList<String>();
		list.add("STR");
		list.add("STR");
		System.out.println(list);
		Iterator<String> iterator1 = list.iterator();
		while (iterator1.hasNext()) {
			System.out.println(iterator1.next());
		}
		for (String l : list) {
			System.out.println(l);
		}
		
		//[2] HASH MAP
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("Kim", "010-1111-2222"); //kim IS KEY
		map.put("Park", "010-3333-4444"); //Park IS KEY
		
		Iterator<String> iterator2 = map.keySet().iterator();
		while (iterator2.hasNext()) {
			String key = iterator2.next();
			System.out.println("key No " + key + "'s data: " + map.get(key));
		}
		
		//[3] HASH SET
		HashSet<String> set = new HashSet<String>();
		set.add("str0");
		set.add("str1");
		set.add("str1");
		Iterator<String> iterator3 = set.iterator();
		while (iterator3.hasNext()) {
			System.out.println(iterator3.next());
		}
	}
}
