package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.BoardDao;

public class BModifyViewService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int fId = Integer.parseInt(request.getParameter("fId"));
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("bModifyView", bDao.modifyView_replyView(fId));

	}

}
