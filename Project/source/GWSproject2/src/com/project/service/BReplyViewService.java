package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.BoardDao;


public class BReplyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bId = Integer.parseInt(request.getParameter("bId"));
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("reply_view", bDao.modifyView_replyView(bId));

	}

}
