package com.lec.ex08_store;

public class TestMain {
	public static void main(String[] args) {

		HeadQuarterStore[] store = { new HeadQuarterStore("= = = Head Quarters = = ="),
				new Store1("= = = Chain 1 = = ="), new Store2("= = = Chain 2 = = ="),
				new Store3("= = = Chain 3 = = =") };

		// FOR COMMAND
		for (int i = 0; i < store.length; i++) {
			System.out.println(store[i].getStr());
			store[i].kimchi();
			store[i].bude();
			store[i].bibim();
			store[i].sundae();
			store[i].rice();

		} // IMPROVED FOR COMMAND
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
