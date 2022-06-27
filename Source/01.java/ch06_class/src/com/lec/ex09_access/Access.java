package com.lec.ex09_access;

public class Access {
	private int privateMember; // WITHIN SAME CALSS
	int defaultMember; // IN SAME CLASS
	protected int protectedMember; // IN SAME CLASS OR INHERTED CALSSES
	public int publicMember; // EVERYWHERE

	private void privateMethod() {
		privateMember = 1;
		System.out.println("private method \t privateMemeber = " + privateMember);
	}

	void defaultMember() {
		defaultMember = 2;
		System.out.println("default method \t\t defaultMemeber = " + defaultMember);
	}

	protected void protectedMember() {
		protectedMember = 3;
		System.out.println("protected method \t protectedMember = " + protectedMember);
	}

	public void publicMember() {
		publicMember = 4;
		System.out.println("public method \t\t publicMember = " + publicMember);
	}
}
