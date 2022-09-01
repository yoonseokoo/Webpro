package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.CartDao;
import com.project.dto.MemberDto;


public class CartViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		String mId = request.getParameter("mId");
		if(mId==null && member != null) {
			mId = member.getmId();
		}
		CartDao cDao = CartDao.getInstance();
		request.setAttribute("carts", cDao.getCart(mId));
	}

}
