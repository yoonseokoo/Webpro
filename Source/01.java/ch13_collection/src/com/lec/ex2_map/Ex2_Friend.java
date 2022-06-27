package com.lec.ex2_map;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Ex2_Friend {
	private String name;
	private String tel;
	private Date birth;
	public Ex2_Friend(String name, String tel) {
		super();
		this.name = name;
		this.tel = tel;
	}
	public Ex2_Friend(String name, String tel, Date birth) {
		super();
		this.name = name;
		this.tel = tel;
		this.birth = birth;
	}

	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy,MM,dd");
		if (birth == null) {
			return "[NAME] = " + name + "\t[TEL] = " + tel;
		} else {
			return "[NAME] = " + name + "\t[TEL] = " + tel + "\t[BDAY] = "
					+ sdf.format(birth);
		}
	}
}