package com.project.dto;

public class LocationDto {
	private int lId;
	private String lStore;
	private String lAddress;
	
	
	public LocationDto() {
		super();
	}


	public LocationDto(int lId, String lStore, String lAddress) {
		this.lId = lId;
		this.lStore = lStore;
		this.lAddress = lAddress;
	}
	public int getlId() {
		return lId;
	}

	public void setlId(int lId) {
		this.lId = lId;
	}

	public String getlAddress() {
		return lAddress;
	}

	public void setlAddress(String lAddress) {
		this.lAddress = lAddress;
	}


	public String getlStore() {
		return lStore;
	}


	public void setlStore(String lStore) {
		this.lStore = lStore;
	}


	@Override
	public String toString() {
		return "'"+lAddress+"'";
	}
	
}
