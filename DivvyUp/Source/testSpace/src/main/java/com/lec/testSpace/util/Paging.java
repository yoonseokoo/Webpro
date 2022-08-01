package com.lec.testSpace.util;

import lombok.Data;
@Data
public class Paging {
	private int currentPage = 1;
	private int pageSize = 3;
	private int blockSize= 3;
	private int startRow;
	private int endRow;
	private int total;
	private int pageCnt;
	private int startPage;
	private int endPage;
	public Paging(int total, String pageNum) {
		this.total = total;
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		startRow = (currentPage-1)*pageSize +1;
		endRow   = startRow + pageSize -1;
		pageCnt  = (int)Math.ceil((double)total/pageSize);
		startPage = ((currentPage-1)/blockSize)*blockSize+1;
		endPage   = startPage + blockSize -1;
		if(endPage>pageCnt) {
			endPage = pageCnt;
		}
	}
	public Paging(int total, String pageNum, int pageSize, int blockSize) {
		this.total = total;
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		startRow = (currentPage-1)*pageSize +1;
		endRow   = startRow + pageSize -1;
		pageCnt  = (int)Math.ceil((double)total/pageSize);
		startPage = ((currentPage-1)/blockSize)*blockSize+1;
		endPage   = startPage + blockSize -1;
		if(endPage>pageCnt) {
			endPage = pageCnt;
		}
	}
}