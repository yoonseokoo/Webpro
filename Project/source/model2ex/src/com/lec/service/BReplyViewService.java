package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.BoardDao;

public class BReplyViewService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int fId = Integer.parseInt(request.getParameter("fId"));
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("reply_view", bDao.modifyView_replyView(fId));

	}

}
