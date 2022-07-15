package com.lec.ex01.controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.ex01.dto.StudentDto;


public class MemberController {
	@ModelAttribute("cnt")
	public int cnt() {
		return 5;
	}
	@RequestMapping(value="input")
	public String join6(@ModelAttribute("student") StudentDto studentDto) {
		return "student/info";
	}
}
