package com.lec.ex01_string;

public class Ex10_StringBuffer {
	public static void main(String[] args) {
		StringBuilder strBuilder = new StringBuilder("abc");
		System.out.println("해쉬코드 결과 : " + strBuilder.hashCode());
		System.out.println("strBuilder : " + strBuilder);
		strBuilder.append("def"); // add 'def': abcdef
		System.out.println("strBuilder : " + strBuilder); // abcdef
		strBuilder.insert(3, "AAA"); // in the third position add "AAA": abcAAAdef
		System.out.println("strBuilder : " + strBuilder);
		strBuilder.delete(3, 5); // delete from 3rd position to the 5th: abcAdef
		System.out.println("StrBuilder : " + strBuilder);
		strBuilder.deleteCharAt(3); // delete 4rd letter
		System.out.println("strBuilder : " + strBuilder);
		System.out.println("해쉬코드 결과 : " + strBuilder.hashCode());
	}
}
