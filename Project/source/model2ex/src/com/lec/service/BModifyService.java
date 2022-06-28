package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.BoardDao;

public class BModifyService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int fId = Integer.parseInt(request.getParameter("fId"));
		String fTitle = request.getParameter("fTitle");
		String fContent = request.getParameter("fContent");
		String fFilename = request.getParameter("fFilename");
		String fIp = request.getParameter("fIp");
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("bModifyResult", bDao.modify(fId, fTitle, fContent, fFilename, fIp));

	}

}
