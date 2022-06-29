package com.lec.map.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.map.dao.MemberDao;
import com.lec.map.dto.MemberDto;

public class ListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao memberDao = new MemberDao();
		request.setAttribute("list", memberDao.list());
	}

}
