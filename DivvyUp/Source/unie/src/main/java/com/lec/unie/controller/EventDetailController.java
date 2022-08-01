package com.lec.unie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.unie.dto.EventDetail;
import com.lec.unie.service.EventDetailService;

@Controller
@RequestMapping(value="eventDetail")
public class EventDetailController {
	@Autowired
	private EventDetailService eventDetailService;
	@RequestMapping(params = "method=insertEventDetail", method={RequestMethod.GET, RequestMethod.POST})
	public String insertEventDetail(EventDetail eventDetail, HttpServletRequest request, String mid, Model model) {
		model.addAttribute("insertEventDetail", eventDetailService.insertEventDetail(eventDetail, request, mid, model));
		return "redirect:main.do?";
	}
}
