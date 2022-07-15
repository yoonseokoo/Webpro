package com.lec.ch08.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {
	private String name;
	private String id;
	private String pw;
	private int age;
	private String email;
	private String address;
	
	@Override
	public String toString() {
		return "MemberDto [name=" + name + ", id=" + id + ", pw=" + pw + ", age=" + age + ", email=" + email
				+ ", address=" + address + "]";
	}
}
