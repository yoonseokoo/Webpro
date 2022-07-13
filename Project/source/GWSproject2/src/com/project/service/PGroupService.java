package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.ProductGroupDao;

public class PGroupService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 10, BLOCKSIZE = 10;
		int startRow = (currentPage-1) * PAGESIZE + 1;
		int endRow   = startRow + PAGESIZE - 1;
		ProductGroupDao bDao = ProductGroupDao.getInstance();
		request.setAttribute("groups", bDao.listGroup(startRow, endRow)); // ★ 글목록
		int totalCnt = bDao.getGroupTotalCnt(); // 등록된 글 갯수
		int pageCnt = (int)Math.ceil((double)totalCnt / PAGESIZE); // 페이지 수
		int startPage = ((currentPage-1)/BLOCKSIZE) * BLOCKSIZE +1;
		int endPage   = startPage + BLOCKSIZE -1; 
		if(endPage>pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);  // ★  이하 페이지 관련 항목들
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("pageCnt", pageCnt);

	}

}
