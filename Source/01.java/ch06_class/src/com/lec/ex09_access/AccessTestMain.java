package com.lec.ex09_access;

public class AccessTestMain {
	public static void main(String[] args) {
		Access obj = new Access();

//		obj.privateMember(); //PRIVATE OBJECTS CAN ONLY BE USED WITHIN THE SAME CLASS
		obj.defaultMember();
		obj.protectedMember();
		obj.publicMember();

	}
}
