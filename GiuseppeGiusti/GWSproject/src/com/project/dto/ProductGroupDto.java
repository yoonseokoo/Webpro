package com.project.dto;

public class ProductGroupDto {
	private String pGroup;
	private String pGroupName;
	private String pGroupDesc;
	private String pGroupImg;

	public ProductGroupDto() {
	}

	public ProductGroupDto(String pGroup, String pGroupName, String pGroupDesc, String pGroupImg) {
		this.pGroup = pGroup;
		this.pGroupName = pGroupName;
		this.pGroupDesc = pGroupDesc;
		this.pGroupImg = pGroupImg;
		
	}

	public String getpGroup() {
		return pGroup;
	}

	public void setpGroup(String pGroup) {
		this.pGroup = pGroup;
	}

	public String getpGroupName() {
		return pGroupName;
	}

	public void setpGroupName(String pGroupName) {
		this.pGroupName = pGroupName;
	}

	public String getpGroupDesc() {
		return pGroupDesc;
	}

	public void setpGroupDesc(String pGroupDesc) {
		this.pGroupDesc = pGroupDesc;
	}

	public String getpGroupImg() {
		return pGroupImg;
	}

	public void setpGroupImg(String pGroupImg) {
		this.pGroupImg = pGroupImg;
	}

	@Override
	public String toString() {
		return "ProductGroupDto [pGroup=" + pGroup + ", pGroupName=" + pGroupName + ", pGroupDesc=" + pGroupDesc
				+ ", pGroupImg=" + pGroupImg + "]";
	}

	

}
