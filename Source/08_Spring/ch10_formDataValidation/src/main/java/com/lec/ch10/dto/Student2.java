package com.lec.ch10.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student2 {
	private String name;
	private int kor;
	private int eng;
	private int math;
	@Override
	public String toString() {
		return "StudentDto [name=" + name + ", kor=" + kor + ", eng=" + eng + ", math=" + math + "]";
	}
	
	
}

