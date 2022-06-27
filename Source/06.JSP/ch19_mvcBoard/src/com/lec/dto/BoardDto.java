package com.lec.dto;

import java.sql.Date;

public class BoardDto {
	private int    bid;
	private String bname;
	private String btitle;
	private String bcontent;
	private Date   bdate;
	private int bhit;
	private int bgroup;
	private int bstep;
	private int bindent;
	private String bip;
	public BoardDto() { }
	public BoardDto(int bid, String bname, String btitle, String bcontent, Date bdate, int bhit, int bgroup, int bstep,
			int bindent, String bip) {
		this.bid = bid;
		this.bname = bname;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bdate = bdate;
		this.bhit = bhit;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.bip = bip;
	}
	public int getBid() {
		return bid;
	}
	public String getBname() {
		return bname;
	}
	public String getBtitle() {
		return btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public Date getBdate() {
		return bdate;
	}
	public int getBhit() {
		return bhit;
	}
	public int getBgroup() {
		return bgroup;
	}
	public int getBstep() {
		return bstep;
	}
	public int getBindent() {
		return bindent;
	}
	public String getBip() {
		return bip;
	}
	@Override
	public String toString() {
		return "BoardDto [bid=" + bid + ", bname=" + bname + ", btitle=" + btitle + ", bcontent=" + bcontent
				+ ", bdate=" + bdate + ", bhit=" + bhit + ", bgroup=" + bgroup + ", bstep=" + bstep + ", bindent="
				+ bindent + ", bip=" + bip + "]";
	}
}