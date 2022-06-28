package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.BoardDao;

public class MDeleteService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int fId = Integer.parseInt(request.getParameter("fId"));
		BoardDao fDao = BoardDao.getInstance();
		request.setAttribute("deleteResult", fDao.delete(fId));

	}

}
