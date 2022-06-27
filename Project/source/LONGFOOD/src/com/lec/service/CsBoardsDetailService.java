package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.CMMg_comment_dao;
import com.lec.dao.Customer_service_dao;
import com.lec.dto.Customer_service_dto;

public class CsBoardsDetailService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		CMMg_comment_dao cmDao = CMMg_comment_dao.getInstance();

		Customer_service_dao csDao = Customer_service_dao.getInstance();
		Customer_service_dto csBoard = csDao.getCsBoard(cno);
		if (csDao.hitup(cno)) {
			request.setAttribute("csBoard", csBoard);
		}
		if (csBoard.isCmexist()) {
			request.setAttribute("csComment", cmDao.getCsComment(cno));
		}
	}

}
