package com.lec.ch10.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Student {
	private String name;
	private int id;
	
	@Override
	public String toString() {
		return "StudentDto [name=" + name + ", id=" + id + "]";
	}
	
}
