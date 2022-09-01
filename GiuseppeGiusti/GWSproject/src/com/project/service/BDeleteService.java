package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.project.dao.BoardDao;



public class BDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bId = Integer.parseInt(request.getParameter("bId"));
		BoardDao bDao = BoardDao.getInstance();
		int result = bDao.delete(bId);
		if(result == BoardDao.SUCCESS) { // 회원가입 진행
			request.setAttribute("bDeleteResult", "글삭제 성공");
		}else {
			request.setAttribute("bDeleteErrorMsg", "글삭제  실패");
		}

	}

}
