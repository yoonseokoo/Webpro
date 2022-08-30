package com.lec.hello.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HelloController {
	@GetMapping("/")
	public String index() {
		return "index";
	}
	@RequestMapping(value="/home", method = RequestMethod.GET)
	public String index(Model model) {
		log.info("first log message");
		model.addAttribute("greeting", "안농, SPring, Boot!");
		return "home";
	}
}
