package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.CartDao;
import com.project.dao.OrdersDao;
import com.project.dto.MemberDto;
import com.project.dto.OrdersDto;

public class emptyCartService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
			String mId = request.getParameter("mId");
			System.out.println(mId);
			CartDao cDao = CartDao.getInstance();
			int empty = cDao.cartEmpty(mId);
				if(empty == CartDao.SUCCESS) {
					request.setAttribute("cartEmptyResult", "장바구니 비움");
				}else {
					request.setAttribute("cartEmptyErrorMsg", "장바구니 비움 실패");
				}
		}
	}
