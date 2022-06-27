package com.lec.ex01_string;

public class Ex08_FriendClass {
	private String name;
	private String phone;
	private String birthday;
	public Ex08_FriendClass() {
	}
	public Ex08_FriendClass(String name, String phone, String birthday) {
		this.name = name;
		this.phone = phone;
		this.birthday = birthday;
	}
	@Override
	public String toString() {
		return "\nÀÌ  ¸§ :" + name + "\nÀü  È­ : " + phone + "\n»ý  ÀÏ : "
				+ birthday;
	}
	public String getName() {
		return name;
	}
	public String getPhone() {
		return phone;
	}
	public String getBirthday() {
		return birthday;
	}
}