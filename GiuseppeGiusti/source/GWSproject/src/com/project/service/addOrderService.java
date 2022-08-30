package com.project.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.CartDao;
import com.project.dao.MemberDao;
import com.project.dao.OrdersDao;
import com.project.dto.MemberDto;
import com.project.dto.OrdersDto;

public class addOrderService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			String oNo = request.getParameter("oNo");
			String oName = request.getParameter("mName");
			String oAddress = request.getParameter("mAddress");
			String oAddressDetail = request.getParameter("mAddressDetail");
			String oPhone = request.getParameter("mPhone");
			String oNote = request.getParameter("oContent");
//			Date oDate = Date.valueOf(request.getParameter("oDate"));
			String mId = request.getParameter("mId");
			
			OrdersDao oDao = OrdersDao.getInstance();
			OrdersDto order = new OrdersDto(oNo, oName, oAddress, oAddressDetail, oPhone, oNote, null, mId);
			
			int result = oDao.addOrder(order);
			if(result == OrdersDao.SUCCESS) {
				request.setAttribute("addOrderResult", "주문이 완료되었습니다");
				
				
			} else {
				request.setAttribute("addOrderErrorMsg", "주문 실패");
		}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
}

