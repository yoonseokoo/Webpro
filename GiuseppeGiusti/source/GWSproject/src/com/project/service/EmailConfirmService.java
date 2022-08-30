package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.MemberDao;


public class EmailConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mEmail = request.getParameter("mEmail");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.mEmailConfirm(mEmail);
		if(result == MemberDao.EXISTENT) {
			request.setAttribute("emailConfirmResult", "해당 이메일 주소를 사용할 수 없습니다. 다른 주소를 선택하십시오");
		}else {
			request.setAttribute("emailConfirmResult", "사용가능한 이메일입니다");
		}
	}
}

