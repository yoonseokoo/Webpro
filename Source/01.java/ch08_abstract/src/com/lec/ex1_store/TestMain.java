package com.lec.ex1_store;

public class TestMain {
	public static void main(String[] args) {

		HeadQuarterStore[] store = { new Store1("\n= = = = = = = = = = =  Chain 1 = = = = = = = = = = = =\n"),
				new Store2("\n= = = = = = = = = = = = Chain 2 = = = = = = = = = = = =\n"),
				new Store3("\n= = = = = = = = = = = = Chain 3 = = = = = = = = = = = =\n") };

		for (

		HeadQuarterStore st : store) {
			System.out.println(st.getStr());
			st.kimchi();
			st.bude();
			st.bibim();
			st.sundae();
			st.rice();

		}
	}
}
