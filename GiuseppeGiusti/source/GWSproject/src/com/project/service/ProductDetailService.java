package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.ProductDao;


public class ProductDetailService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pId = request.getParameter("pId");
		ProductDao pDao = ProductDao.getInstance();
		request.setAttribute("product", pDao.productDetail(pId));// TODO Auto-generated method stub

	}

}
