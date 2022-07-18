package com.lec.ch11.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor

public class BoardDto {
	private int bid;
	private String bname;
	private String btitle;
	private String bcontent;
	private Timestamp bdate;
	private Date date;
	private int bhit;
	private int bgroup;
	private int bstep;
	private int bindent;
	private String bip;
	
	@Override
	public String toString() {
		return "BoardDto [bid=" + bid + ", bname=" + bname + ", btitle=" + btitle + ", bcontent=" + bcontent
				+ ", bdate=" + bdate + ", date=" + date + ", bhit=" + bhit + ", bgroup=" + bgroup + ", bstep=" + bstep
				+ ", bindent=" + bindent + ", bip=" + bip + "]";
	}
	
	
}
