package com.lec.ex4_examples;

import java.util.Date;

public class Member {
	private String name;
	private String tel;
	private Date birthday;
	private String address;
	public Member(String name, String tel, Date birthday, String address) {
		super();
		this.name = name;
		this.tel = tel;
		this.birthday = birthday;
		this.address = address;
	}
	@Override
	public String toString() {
		return "\n[NAME]=" + name + "\t[TEL]=" + tel + "\t[BIRTHDAY]="
				+ birthday + "\t[ADDRESS]=" + address;
	}

}
