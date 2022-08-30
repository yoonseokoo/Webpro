package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.CartDao;
import com.project.dao.MemberDao;

public class CartAddService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		String pId = request.getParameter("pId");
		String cartQuantity = request.getParameter("cartQuantity");
		CartDao cDao = CartDao.getInstance();
		CartDao cDao2 = CartDao.getInstance();
		int chkExistent = cDao.cartProductExist(mId, pId);
		
		
		if(chkExistent == CartDao.NONEXISTENT) {
			int result = cDao2.cartAddProduct(mId, pId, cartQuantity);
			if(result == CartDao.SUCCESS) {
				HttpSession session = request.getSession();
				MemberDao mDao = MemberDao.getInstance();
				session.setAttribute("member", mDao.getMember(mId));
				request.setAttribute("cartAddProductResult", "장바구니에 상품 추가 성공!");
			}else {
				request.setAttribute("cartAddProductErrorMsg", "장바구니에 상품 추가 실패하셨습니다.");
			}
		} else if(chkExistent == CartDao.EXISTENT) {
			request.setAttribute("cartExistsResult", "장바구니에 이미 추가한 상품입니다.");
		}
	}

}
