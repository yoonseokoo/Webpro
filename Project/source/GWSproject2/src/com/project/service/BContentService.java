package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.BoardDao;


public class BContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
			int bId = Integer.parseInt(request.getParameter("bId"));
			BoardDao bDao = BoardDao.getInstance();
			request.setAttribute("contentView", bDao.contentView(bId));// TODO Auto-generated method stub

	}

}
