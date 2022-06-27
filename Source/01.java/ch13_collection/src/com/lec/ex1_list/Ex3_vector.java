package com.lec.ex1_list;

import java.util.Vector;

public class Ex3_vector {
	public static void main(String[] args) {
		Vector<Object> vec = new Vector<Object>();
		vec.add(10);
		vec.add(new Ex3_AClass());
		Ex3_BClass objB = new Ex3_BClass();
		vec.add(objB);

		System.out.println(vec);
		for (Object obj : vec) {
			System.out.println(obj);
		}
	}
}
