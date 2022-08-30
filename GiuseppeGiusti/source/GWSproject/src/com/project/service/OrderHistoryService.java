package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.MemberDao;
import com.project.dao.OrderDetailDao;
import com.project.dao.OrdersDao;

public class OrderHistoryService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		OrderDetailDao oDao = OrderDetailDao.getInstance();
		request.setAttribute("orders", oDao.getOrderDetail(mId));
	}

}
