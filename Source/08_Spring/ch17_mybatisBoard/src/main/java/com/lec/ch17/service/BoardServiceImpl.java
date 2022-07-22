package com.lec.ch17.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.ch17.dao.BoardDao;
import com.lec.ch17.model.Board;
import com.lec.ch17.util.Paging;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao boardDao;
	@Override
	public List<Board> boardList(String pageNum) {
		Paging paging = new Paging(boardDao.totCnt(), pageNum, 10, 5);
		Board board = new Board();
		board.setStartRow(paging.getStartRow());
		board.setEndRow(paging.getEndRow());
		return boardDao.boardList(board);
	}

	@Override
	public int totCnt() {
		return boardDao.totCnt();
	}

	@Override
	public int write(Board board) {
		return boardDao.write(board);
	}
	@Override
	public Board content(int bid) {
		boardDao.hitUp(bid);
		return boardDao.content(bid);
	}
	@Override
	public int delete(int empno) {
		return boardDao.delete(empno);
	}
	@Override
	public int modify(Board board) {
		return boardDao.modify(board);
	}
	@Override
	public int reply(Board board) {
		boardDao.stepA(board);
		board.setBstep(board.getBstep()+1);
		board.setBindent(board.getBindent()+1);
		return boardDao.reply(board);
	}

	}
