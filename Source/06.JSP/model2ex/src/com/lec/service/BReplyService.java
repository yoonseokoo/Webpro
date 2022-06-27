package com.lec.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.BoardDao;

public class BReplyService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		String fTitle = request.getParameter("fTitle");
		String fContent = request.getParameter("fContent");
		String fFilename = request.getParameter("fFilename");
		int fGroup = Integer.parseInt(request.getParameter("fGroup"));
		int fStep = Integer.parseInt(request.getParameter("fStep"));
		int fIndent = Integer.parseInt(request.getParameter("fIndent"));
		String fIp = request.getRemoteAddr();
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("replyResult", bDao.reply(mId, fTitle, fContent, fFilename, fGroup, fStep, fIndent, fIp));

	}

}
