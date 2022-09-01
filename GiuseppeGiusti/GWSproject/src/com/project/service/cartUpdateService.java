package com.project.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.CartDao;
import com.project.dto.CartDto;

public class cartUpdateService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
try {
		String cartQuantity = request.getParameter("cartQuantity");
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		CartDao cDao = CartDao.getInstance();
			
		//MODIFYING
		CartDto cart = new CartDto(cartNo, cartQuantity);
		int result = cDao.updateCart(cart);
			if(result == CartDao.SUCCESS) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("cart", cart);
				request.setAttribute("cartUpdateResult", "주문 수량 업데이트 성공");
			}else {
				request.setAttribute("cartUpdateResult", "주문 수량 업데이트  실패");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
}


