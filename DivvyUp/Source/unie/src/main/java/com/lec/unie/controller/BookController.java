package com.lec.unie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.unie.dto.Book;
import com.lec.unie.service.BookService;
import com.lec.unie.util.Paging;

@Controller
@RequestMapping(value="book")
public class BookController {
	@Autowired
	private BookService bookService;
	@RequestMapping(params="method=detail", method = {RequestMethod.GET, RequestMethod.POST})
	public String detail(int bnum, Model model) {
		model.addAttribute("bDto", bookService.getDetailBook(bnum));
		return "book/detail";
	}
	@RequestMapping(params="method=list", method={RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Model model, Book book) {
		model.addAttribute("bookList", bookService.bookList(pageNum, book));
		model.addAttribute("paging", new Paging(bookService.totCntBook(book), pageNum, 3, 3));
		return "book/list";
	}
	@RequestMapping(params="method=modifyForm", method = RequestMethod.GET)
	public String modifyForm(int bnum, Model model) {
		model.addAttribute("bDto", bookService.getDetailBook(bnum));
		return "book/modifyForm";
	}
	@RequestMapping(params="method=modify", method = RequestMethod.POST)
	public String modify(MultipartHttpServletRequest mRequest, @ModelAttribute("bDto") Book book, Model model, String pageNum) {
		model.addAttribute("modifyResult", bookService.modifyBook(mRequest, book));
		System.out.println("수정완료");
		return "redirect:book.do?method=list&pageNum="+pageNum;
	}
	@RequestMapping(params="method=registerForm", method = RequestMethod.GET)
	public String registerForm() {
		return "book/registerForm";
	}
	@RequestMapping(params="method=register", method = RequestMethod.POST)
	public String register(MultipartHttpServletRequest mRequest, @ModelAttribute("bDto") Book book, Model model) {
		model.addAttribute("registerResult", bookService.registerBook(mRequest, book));
		return "redirect:book.do?method=list";
		
	}
}

