package com.lec.ex02_store;

public class TestMain {
	public static void main(String[] args) {

		HeadQuarterStore[] store = { new Store1("\n= = = = = = = = = = = = Chain 1 = = = = = = = = = = = =\n"),
				new Store2("\n= = = = = = = = = = = = Chain 2 = = = = = = = = = = = =\n"),
				new Store3("\n= = = = = = = = = = = = Chain 3 = = = = = = = = = = = =\n") };

		// 일반 for 문
		for (int i = 0; i < store.length; i++) {
			System.out.println(store[i].getStr());
			store[i].kimchi();
			store[i].bude();
			store[i].bibim();
			store[i].sundae();
			store[i].rice();

		} // 확장 for 문
		for (HeadQuarterStore st : store) {
			System.out.println(st.getStr());
			st.kimchi();
			st.bude();
			st.bibim();
			st.sundae();
			st.rice();

		}
	}
}
