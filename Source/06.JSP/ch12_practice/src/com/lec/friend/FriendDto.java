package com.lec.friend;

public class FriendDto {

	private int fno; // 순번
	private String fname; // 이름
	private String fphone; // 번호

	public FriendDto() {
	}

	public FriendDto(int fno, String fname, String fphone) {
		this.fno = fno;
		this.fname = fname;
		this.fphone = fphone;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFphone() {
		return fphone;
	}

	public void setFphone(String fphone) {
		this.fphone = fphone;
	}

	@Override
	public String toString() {
		return "FriendDto [fno=" + fno + ", fname=" + fname + ", fphone=" + fphone + "]";
	}

}