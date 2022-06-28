package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.MemberDao;

public class EmailConfirmService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mEmail = request.getParameter("mEmail");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.mEmailConfirm(mEmail);
		if(result == MemberDao.EXISTENT) {
			request.setAttribute("emailConfirmResult", "Email already exists");
		}else {
			request.setAttribute("emailConfirmResult", "Available email");
		}
	}
}

