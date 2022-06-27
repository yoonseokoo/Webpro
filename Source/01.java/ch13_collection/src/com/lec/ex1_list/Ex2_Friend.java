package com.lec.ex1_list;

public class Ex2_Friend {
	private String name;
	private String tel;
	private String birth;
	private String address;

	public Ex2_Friend(String name, String tel) {
		super();
		this.name = name;
		this.tel = tel;
	}

	public Ex2_Friend(String name, String tel, String birth, String address) {
		super();
		this.name = name;
		this.tel = tel;
		this.birth = birth;
		this.address = address;
	}

	@Override
	public String toString() {
		if (birth == null && address == null) {
			return "[NAME] = " + name + "\t[TEL] = " + tel + "\n";
		} else {
			return "[NAME] = " + name + "\t[TEL] = " + tel + "\t[B-DAY] = " + birth + "\t[ADDRESS] = ";
		}
	}
}