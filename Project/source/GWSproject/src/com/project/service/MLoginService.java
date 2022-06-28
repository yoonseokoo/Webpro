package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.MemberDao;
import com.lec.dto.MemberDto;

public class MLoginService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.loginCheck(mId, mPw);
		if(result==MemberDao.LOGIN_SUCCESS) { 
			HttpSession session = request.getSession();
			MemberDto member = mDao.getMember(mId);
			session.setAttribute("member", member);
		}else { 
			request.setAttribute("loginErrorMsg", "Please check ID & PW");
		}
	}

}