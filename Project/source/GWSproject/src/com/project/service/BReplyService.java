package com.project.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.BoardDao;


public class BReplyService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String bImage = request.getParameter("bImage");
		int bGroup = Integer.parseInt(request.getParameter("bGroup"));
		int bStep = Integer.parseInt(request.getParameter("bStep"));
		int bIndent = Integer.parseInt(request.getParameter("bIndent"));
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("replyResult", bDao.reply(mId, bTitle, bContent, bImage, bGroup, bStep, bIndent));

	}

}
