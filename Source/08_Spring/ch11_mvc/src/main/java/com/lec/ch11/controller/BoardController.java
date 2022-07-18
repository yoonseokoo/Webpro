package com.lec.ch11.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ch11.dto.BoardDto;
import com.lec.ch11.service.BContentService;
import com.lec.ch11.service.BListService;
import com.lec.ch11.service.BModifyReplyViewService;
import com.lec.ch11.service.BModifyService;
import com.lec.ch11.service.BReplyService;
import com.lec.ch11.service.BWriteService;
import com.lec.ch11.service.BdeleteService;
import com.lec.ch11.service.Service;

@Controller
@RequestMapping("mvcboard")
public class BoardController {
	private Service bservice;
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(String pageNum, Model model) {
		model.addAttribute("pageNum", pageNum);
		bservice = new BListService();
		bservice.execute(model);
		return "mvcboard/list";
	}
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String list_post(String pageNum, Model model) {
		model.addAttribute("pageNum", pageNum);
		bservice = new BListService();
		bservice.execute(model);
		return "mvcboard/list";
	}
	@RequestMapping(value="/writeView", method=RequestMethod.GET)
	public String writeView() {
		return "mvcboard/write";
	}
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(@ModelAttribute("bDto") BoardDto boardDto, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		bservice = new BWriteService();
		bservice.execute(model);
		return "forward:list.do";
	}
	@RequestMapping(value="/content", method=RequestMethod.GET)
	public String content(int bid, Model model) {
		model.addAttribute("bid", bid);
		bservice = new BContentService();
		bservice.execute(model);
		return "mvcboard/content";
	}
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyView(int bid, Model model) {
		model.addAttribute("bid", bid);
		bservice = new BModifyReplyViewService();
		bservice.execute(model);
		return "mvcboard/modify";
	}
	@RequestMapping(value="modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute("bDto") BoardDto bDto, HttpServletRequest request, 
			Model model) {
		model.addAttribute("request", request);
		bservice = new BModifyService();
		bservice.execute(model);
		return "forward:list.do";
	}	
	@RequestMapping(value="delete", method=RequestMethod.GET)
		public String delete(int bid, Model model) {
		model.addAttribute("bid", bid);
		bservice = new BdeleteService();
		bservice.execute(model);
		return "forward:list.do";
	}
	@RequestMapping(value="reply", method = RequestMethod.GET)
	public String reply_view(int bid, Model model) {
		model.addAttribute("bid", bid);
		bservice = new BModifyReplyViewService();
		bservice.execute(model);
		return "mvcboard/reply";
	}

	@RequestMapping(value="reply", method = RequestMethod.POST)
	public String reply(BoardDto boardDto, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		bservice = new BReplyService();
		bservice.execute(model);
		return "forward:list.do";
	}	

}
