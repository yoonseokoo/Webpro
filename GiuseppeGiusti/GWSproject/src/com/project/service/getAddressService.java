package com.project.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.LocationDao;
import com.project.dao.ProductDao;
import com.project.dao.ProductGroupDao;
import com.project.dto.LocationDto;

public class getAddressService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		LocationDao lDao = LocationDao.getInstance();
		try {
			request.setAttribute("locationLists", lDao.getAddress());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}