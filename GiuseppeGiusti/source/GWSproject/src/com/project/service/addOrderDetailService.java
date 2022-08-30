package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.OrderDetailDao;
import com.project.dao.ProductDao;
import com.project.dto.MemberDto;

public class addOrderDetailService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
			OrderDetailDao oDetail = OrderDetailDao.getInstance();
			int result = oDetail.addOrderDetail(mId);
			if(result == OrderDetailDao.SUCCESS) {
				
				request.setAttribute("addOrderDetail", "상세주문 정보 추가 성공");
		} else {
			request.setAttribute("addOrderDetailErrorMsg", "상세주문 정보 추가 실패");
		}
		
	}
}


	
	

