package com.lec.ex01_string;

public class Ex05_regex {
	public static void main(String[] args) {
		// System.out.println("replace =>" + str.replace("0", "ȫ")); // 0�� ȫ����
		// �ٲ�
		/*
		 * ����ǥ���� (regex) 1. ���� : https://goo.gl/HLntbd
		 * 
		 * 2. ���� ���� \d (���ڿ� ��ġ, [0-9]�� ����) \D(���ڰ� �ƴ� ��) \s (whitespacen : space,
		 * ��, ����) \w (�����ڳ� ����, [a-zA-Z0-9]�� ����) \W(�����ڳ� ���ڰ� �ƴ� ����) . (���� �ϳ�) +
		 * (1���̻� �ݺ�) (0�� �̻� �ݺ�) ? (0~1�� �ݺ�) {2,4} (2~4ȸ �ݺ�) 3. ����ǥ���� ������ :
		 * https://regexr.com https://www.regexpal.com ex. ��ȭ��ȣ :
		 * .?[0-9]{2,3}.[0-9]{3,4}-[0-9]{4} �̸��� : 4. Ư�� ����ǥ������ ���ڿ� ���� :
		 * replaceAll("����ǥ����" , "��ü���ڿ�")
		 */
		String str = "010-9999-9999 yisy0703@naver.com  (02)565-8888  �ݰ����ϴ�. ���� Hello 951212-2521251 abc@sds.co.kr";
		// ��ȭ��ȣ ����
		System.out.println(str.replaceAll(
				"[(]?[0-9]{2,3}\\D[0-9]{3,4}-[0-9]{4}", "** ��ȭ��ȣ ���� **"));
		// �̸��� ����
		System.out
				.println(str.replaceAll("\\w+@\\w+(.\\w+){1,2}", "**�̸��� ����**"));
		// ���ĺ� ��� *�� ��ü
		System.out.println(str.replaceAll("[a-zA-Z]", "*"));
		// �ѱ� �� �� ����
		System.out.println(str.replaceAll("[��-R��-��]", ""));
		// �ֹι�ȣ ���ڸ��� *�� ��ü
		System.out.println(str.replaceAll("[0-9]{7}", "*******"));
	}
}
