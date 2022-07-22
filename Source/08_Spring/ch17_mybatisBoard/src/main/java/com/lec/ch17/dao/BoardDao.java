package com.lec.ch17.dao;

import java.util.List;

import com.lec.ch17.model.Board;

public interface BoardDao {
	public List<Board> boardList(Board board);
	public int totCnt();
	public int write(Board board);
	public Board content(int bid);
	public void hitUp(int bid);
	public int delete(int bid);
	public int modify(Board board);
	public int reply(Board board);
	public int stepA(Board board);
}
