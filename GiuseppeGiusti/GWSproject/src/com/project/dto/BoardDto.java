package com.project.dto;

import java.sql.Date;

public class BoardDto {
	private int bId;
	private String mId;
	private String bTitle;
	private String bContent;
	private String bImage;
	private int bHit;
	private int bGroup;
	private int bStep;
	private int bIndent;
	private Date bRdate;
	
	public BoardDto() {
	}
	public BoardDto(int bId, String mId, String bTitle, String bContent, String bImage, int bHit, int bGroup, int bStep, int bIndent, Date bRdate) {

		this.bId = bId;
		this.mId = mId;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bImage = bImage;
		this.bHit = bHit;
		this.bGroup = bGroup;
		this.bStep = bStep;
		this.bIndent = bIndent;
		this.bRdate = bRdate;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbImage() {
		return bImage;
	}
	public void setbImage(String bImage) {
		this.bImage = bImage;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public int getbGroup() {
		return bGroup;
	}
	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}
	public int getbStep() {
		return bStep;
	}
	public void setbStep(int bStep) {
		this.bStep = bStep;
	}
	public int getbIndent() {
		return bIndent;
	}
	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}
	public Date getbRdate() {
		return bRdate;
	}
	public void setbRdate(Date bRdate) {
		this.bRdate = bRdate;
	}
	@Override
	public String toString() {
		return "BoardDtp [bId=" + bId + ", mId=" + mId + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bImage="
				+ bImage + ", bHit=" + bHit + ", bGroup=" + bGroup + ", bStep=" + bStep + ", bIndent=" + bIndent
				+ ", bRdate=" + bRdate + "]";
	}
	
	
}
