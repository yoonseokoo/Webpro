package com.lec.map.dto;

public class MemberDto {
	private String id;
	private String pw;
	private String name;
	private String postcode;
	private String address;
	private String detailAddress;
	public MemberDto() { }
	public MemberDto(String id, String pw, String name, String postcode, String address, String detailAddress) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.postcode = postcode;
		this.address = address;
		this.detailAddress = detailAddress;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pw=" + pw + ", name=" + name + ", postcode=" + postcode + ", address="
				+ address + ", detailAddress=" + detailAddress + "]";
	}
}
