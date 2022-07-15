package com.lec.ch07.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	// http://localhost:8090/ch07/ 요청처리
	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("greeting", "안녕하세요, 스프링");
		return "main"; // view : /WEB-INF/views/main.jsp
	}
}
