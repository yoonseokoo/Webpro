package com.lec.ch11.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lec.ch11.dao.BoardDao;
import com.lec.ch11.dto.BoardDto;

public class BReplyService implements Service {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		BoardDto boardDto = (BoardDto)map.get("boardDto");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		boardDto.setBip(request.getRemoteAddr());
		BoardDao boardDao = BoardDao.getInstance();
		model.addAttribute("replyResult", boardDao.reply(boardDto));
	}
}

