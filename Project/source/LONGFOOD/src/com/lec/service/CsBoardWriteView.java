package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.Member_dao;

public class CsBoardWriteView implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		Member_dao mDao = Member_dao.getInstance();
		request.setAttribute("orders", mDao.getOrdersAll(mid));
	}

}