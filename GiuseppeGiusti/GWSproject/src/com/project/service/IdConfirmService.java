package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.MemberDao;

public class IdConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.mIdConfirm(mId);
		if(result == MemberDao.EXISTENT) {
			request.setAttribute("idConfirmResult", "다른 아이디를 선택해 주세요");
		}else {
			request.setAttribute("idConfirmResult", "사용가능한 아이디입니다");
		}
	}
}
