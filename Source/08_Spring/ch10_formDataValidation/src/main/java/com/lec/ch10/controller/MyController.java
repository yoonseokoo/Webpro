package com.lec.ch10.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ch10.dto.Student;
import com.lec.ch10.dto.Student2;

@Controller
public class MyController {
	@ModelAttribute("cnt")
	public int cnt() {
		return 4;
	}
	@RequestMapping(value="inputForm.do", method = RequestMethod.GET)
	public String inputForm() {
		return "ex/inputForm";
	}
	@RequestMapping(value="/input.do", method=RequestMethod.GET)
	public String input(Student student, Errors errors, Model model) {
		StudentValidator validator = new StudentValidator();
		validator.validate(student, errors);
		if(errors.hasErrors()) {
			if(errors.getFieldError("name")!=null) {
				model.addAttribute("nameError", "please enter a name to continue");
			}
			if(errors.getFieldError("id")!=null) {
				model.addAttribute("idError", "please enter a natural number as an ID");
			}
			return "ex/inputForm";
		}
		return "ex/inputResult";
	}
	
	@RequestMapping(value="inputForm2.do", method = RequestMethod.GET)
	public String inputForm2() {
		return "quiz/inputForm2";
	}
	@RequestMapping(value="/input2.do", method=RequestMethod.POST)
	public String input(Student2 student2, Errors errors, Model model) {
		StudentValidator2 validator = new StudentValidator2();
		validator.validate(student2, errors);
		if(errors.hasErrors()) {
			if(errors.getFieldError("name")!=null) {
				model.addAttribute("nameError", "please enter a name to continue");
			}
			if(errors.getFieldError("kor")!=null) {
				model.addAttribute("korError", "please enter a valid Korean score");
			}
			if(errors.getFieldError("eng")!=null) {
				model.addAttribute("engError", "please enter a valid English score");
			}
			if(errors.getFieldError("math")!=null) {
				model.addAttribute("mathError", "please enter a valid math score");
			}
			return "quiz/inputForm2";
		}
		return "quiz/inputResult2";
	}
	

}
