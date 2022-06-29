package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.MemberDao;

public class IdConfirmService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.mIdConfirm(mId);
		if(result == MemberDao.EXISTENT) {
			request.setAttribute("idConfirmResult", "Unavailable ID");
		}else {
			request.setAttribute("idConfirmResult", "Available ID");
		}
	}
}
