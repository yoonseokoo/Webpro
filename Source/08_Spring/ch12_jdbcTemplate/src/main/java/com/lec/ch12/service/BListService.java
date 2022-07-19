package com.lec.ch12.service;

import java.util.Map;

import org.springframework.ui.Model;

import com.lec.ch12.dao.BoardDao;

public class BListService implements Service {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		String pageNum = (String)map.get("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		final int PAGESIZE = 10, BLOCKSIZE=10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*PAGESIZE+1;
		int endRow = startRow +PAGESIZE -1;
		BoardDao boardDao = BoardDao.getInstance();
		model.addAttribute("boardList", boardDao.boardList(startRow, endRow));
		int orderNum = startRow;
		int totCnt = boardDao.getBoardTotCnt();
		int inverseNum = totCnt - startRow + 1;
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage - 1)/BLOCKSIZE )* BLOCKSIZE +1;
		// startpage = currentPage - (currentPage-1)%BLOCKSIZE; - same formula
		int endPage = startPage + BLOCKSIZE -1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		model.addAttribute("orderNum", orderNum);
		model.addAttribute("totCnt", totCnt);
		model.addAttribute("inverseNum", inverseNum);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("BLOCKSIZE", BLOCKSIZE);
		model.addAttribute("pageNum", pageNum);
		
		}
}
