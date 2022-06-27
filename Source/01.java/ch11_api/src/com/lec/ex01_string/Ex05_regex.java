package com.lec.ex01_string;

public class Ex05_regex {
	public static void main(String[] args) {
		// System.out.println("replace =>" + str.replace("0", "홍")); // 0만 홍으로
		// 바뀜
		/*
		 * 정규표현식 (regex) 1. 참조 : https://goo.gl/HLntbd
		 * 
		 * 2. 간략 문법 \d (숫자와 매치, [0-9]와 동일) \D(숫자가 아닌 것) \s (whitespacen : space,
		 * 탭, 엔터) \w (영문자나 숫자, [a-zA-Z0-9]와 동일) \W(영문자나 숫자가 아닌 문자) . (문자 하나) +
		 * (1번이상 반복) (0번 이상 반복) ? (0~1번 반복) {2,4} (2~4회 반복) 3. 정규표현식 연습장 :
		 * https://regexr.com https://www.regexpal.com ex. 전화번호 :
		 * .?[0-9]{2,3}.[0-9]{3,4}-[0-9]{4} 이메일 : 4. 특정 정규표현식의 문자열 변경 :
		 * replaceAll("정규표현식" , "대체문자열")
		 */
		String str = "010-9999-9999 yisy0703@naver.com  (02)565-8888  반갑습니다. ㅎㅎ Hello 951212-2521251 abc@sds.co.kr";
		// 전화번호 지춤
		System.out.println(str.replaceAll(
				"[(]?[0-9]{2,3}\\D[0-9]{3,4}-[0-9]{4}", "** 전화번호 지움 **"));
		// 이메일 지움
		System.out
				.println(str.replaceAll("\\w+@\\w+(.\\w+){1,2}", "**이메일 지움**"));
		// 알파벳 대신 *로 대체
		System.out.println(str.replaceAll("[a-zA-Z]", "*"));
		// 한글 싹 다 없애
		System.out.println(str.replaceAll("[가-Rㄱ-ㅎ]", ""));
		// 주민번호 뒷자리를 *로 대체
		System.out.println(str.replaceAll("[0-9]{7}", "*******"));
	}
}
