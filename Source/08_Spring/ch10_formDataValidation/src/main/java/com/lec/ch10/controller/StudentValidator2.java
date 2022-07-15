package com.lec.ch10.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.lec.ch10.dto.Student2;

public class StudentValidator2 implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Student2.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Student2 student2 = (Student2)target;
		String name = student2.getName();
		int kor = student2.getKor();
		int eng = student2.getEng();
		int math = student2.getMath();
		
		if(name == null || name.trim().isEmpty() || name.length()<=1) {
			errors.rejectValue("name", "no"); 
		}
		 
		if (kor<0 || kor>100) {
			errors.rejectValue("kor", "no");
		}
		if (eng<0 || eng>100) {
			errors.rejectValue("eng", "no");
		}
		if (math<0 || math>100) {
			errors.rejectValue("math", "no");
		}
		
	}

}
