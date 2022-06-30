package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.BoardDao;


public class BModifyService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bId = Integer.parseInt(request.getParameter("bId"));
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String bImage = request.getParameter("bImage");
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("bModifyResult", bDao.modify(bId, bTitle, bContent, bImage));

	}

}
