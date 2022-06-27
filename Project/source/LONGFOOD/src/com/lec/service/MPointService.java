package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.Member_dao;
import com.lec.dto.NextGrade_dto;

public class MPointService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		int mcumulative_buy = Integer.parseInt(request.getParameter("mcumulative_buy"));
		Member_dao mDao = Member_dao.getInstance();
		NextGrade_dto nextGrade = mDao.getNextGrade(mid, mcumulative_buy);
		request.setAttribute("nextGrade", nextGrade);

	}

}
