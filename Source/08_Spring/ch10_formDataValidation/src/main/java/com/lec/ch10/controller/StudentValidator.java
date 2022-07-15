package com.lec.ch10.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.lec.ch10.dto.Student;

public class StudentValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Student.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// validate(student,errors) 호출
		
		Student student = (Student)target;
		String name = student.getName();
		int id = student.getId();
		
		/*
		 * if(name == null || name.trim().isEmpty() || name.length()<=1) {
		 * errors.rejectValue("name", "no"); }
		 */
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "no");
		
		if (id<=0) {
			errors.rejectValue("id", "no");
		}
		
	}

}
