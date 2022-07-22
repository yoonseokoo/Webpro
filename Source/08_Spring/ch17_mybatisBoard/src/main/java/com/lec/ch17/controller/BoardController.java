package com.lec.ch17.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ch17.model.Board;
import com.lec.ch17.service.BoardService;
import com.lec.ch17.util.Paging;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	@RequestMapping(value="boardList", method = {RequestMethod.GET, RequestMethod.POST })
		public String boardList(String pageNum, Model model) {
		model.addAttribute("boardList", boardService.boardList(pageNum));
		model.addAttribute("paging", new Paging(boardService.totCnt(), pageNum, 10, 5));
		return "boardList";
	}
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeView() {
		return "write";
	}
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(Board board, Model model, HttpServletRequest request) {
		board.setBip(request.getLocalAddr());
		model.addAttribute("writeResult", boardService.write(board));
		return "forward:boardList.do";
	}
	@RequestMapping(value = "content", method = RequestMethod.GET)
	public String content(int bid, Model model) {
		model.addAttribute("content", boardService.content(bid));
		return "content";
	}
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int bid, Model model) {
		model.addAttribute("deleteResult", boardService.delete(bid));
		return "forward:boardList.do";
	}
	@RequestMapping(value="modify", method = RequestMethod.GET)
	public String modify(int bid, Model model) {
		model.addAttribute("Board", boardService.content(bid));
		return "modify";
	}
	@RequestMapping(value="modify", method = RequestMethod.POST)
	public String modify(Board board, Model model, HttpServletRequest request) {
		board.setBip(request.getLocalAddr());
		model.addAttribute("modifyResult", boardService.modify(board));
		return "forward:boardList.do";
	}
	@RequestMapping(value = "reply", method = RequestMethod.GET)
	public String replyView(int bid, Model model) {
		model.addAttribute("boardDto", boardService.content(bid));
		return "reply";
	}
	
	@RequestMapping(value = "reply", method = RequestMethod.POST)
	public String reply(Board board, Model model, HttpServletRequest request) {
		board.setBip(request.getLocalAddr());
		model.addAttribute("replyResult", boardService.reply(board));
		return "forward:boardList.do";
	}
	
	
	

}
