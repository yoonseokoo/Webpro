package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.CartDao;
import com.project.dao.MemberDao;


public class CartDelProductService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		String mId = request.getParameter("mId");
		CartDao cDao = CartDao.getInstance();
		int result = cDao.cartDelProduct(cartNo);
		if(result == CartDao.SUCCESS) { // 회원가입 진행
			request.setAttribute("cartDelProductResult", "장바구니에 물품 삭제 성공");
			HttpSession session = request.getSession();
			MemberDao mDao = MemberDao.getInstance();
			session.setAttribute("member", mDao.getMember(mId));
		}else {
			request.setAttribute("cartDelProductErrorMsg", "오류 관리자에게 문의하세요");
		}
		
	}

}
