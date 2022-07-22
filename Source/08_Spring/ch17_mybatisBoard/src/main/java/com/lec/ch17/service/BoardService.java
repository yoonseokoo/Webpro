package com.lec.ch17.service;

import java.util.List;


import com.lec.ch17.model.Board;

public interface BoardService {
	public List<Board> boardList(String pageNum);
	public int totCnt();
	public int write(Board board);
	public Board content(int bid);
	public int delete(int bid);
	public int modify(Board board);
	public int reply(Board board);
}
