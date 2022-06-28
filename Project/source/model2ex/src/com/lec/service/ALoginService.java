package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.AdminDao;
import com.lec.dto.AdminDto;


public class ALoginService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String aId = request.getParameter("aId");
		String aPw = request.getParameter("aPw");
		AdminDao aDao = AdminDao.getInstance();
		int result = aDao.loginCheck(aId, aPw);
		if(result==AdminDao.LOGIN_SUCCESS) { 
			HttpSession session = request.getSession();
			AdminDto admin = aDao.getAdmin(aId);
			session.setAttribute("admin", admin);
		}else { 
			request.setAttribute("AdminloginErrorMsg", "Please check ID & PW");
		}
	}

}