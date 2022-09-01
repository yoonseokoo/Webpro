package com.project.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.ProductDao;
import com.project.dto.ProductDto;

public class PSearchService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String schName = request.getParameter("schName");
		ProductDao pDao = ProductDao.getInstance();
		ArrayList<ProductDto> prods = pDao.listProds(schName);
		request.setAttribute("prods", prods);
	}

}
