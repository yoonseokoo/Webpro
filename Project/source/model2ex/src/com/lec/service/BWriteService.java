package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.BoardDao;

public class BWriteService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		String fTitle = request.getParameter("fTitle");
		String fContent = request.getParameter("fContent");
		String fFilename  = request.getParameter("fFilename");
		String fIp = request.getRemoteAddr();
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("writeResult", bDao.insertBoard(mId, fTitle, fContent, fFilename, fIp));
	}
}