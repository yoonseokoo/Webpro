package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.Customer_service_dao;

public class CsBoardReplyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		Customer_service_dao cDao = Customer_service_dao.getInstance();
		request.setAttribute("csBoard", cDao.getCsBoard(cno));
	}

}