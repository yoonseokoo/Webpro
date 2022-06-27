package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.BoardDao;

public class BContentService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
			int fId = Integer.parseInt(request.getParameter("fId"));
			BoardDao bDao = BoardDao.getInstance();
			request.setAttribute("contentView", bDao.contentView(fId));// TODO Auto-generated method stub

	}

}
