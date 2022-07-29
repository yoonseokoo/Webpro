package com.lec.du.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	@RequestMapping("main")
	public String home(Model model) {
		model.addAttribute("greeting", "안녕하세요, 스프링");
		return "main";
	}
	
}