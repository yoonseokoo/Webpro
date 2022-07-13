package com.project.dto;

import java.sql.Date;

public class ProductDto {

	private String pId;
	private String pName;
	private String pGroup;
	private int pPrice;
	private int pDiscount;
	private String pImage;
	private int pStock;
	private String pDescription;
	private int pCumSales;
	private int pReviewCnt;
	private double pRating;
	private Date pRdate;

	public ProductDto() {
	}

	public ProductDto(String pId, String pName, String pGroup, int pPrice, int pDiscount, String pImage, int pStock,
			String pDescription, int pCumSales, int pReviewCnt, double pRating, Date pRdate) {
		this.pId = pId;
		this.pName = pName;
		this.pGroup = pGroup;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pImage = pImage;
		this.pStock = pStock;
		this.pDescription = pDescription;
		this.pCumSales = pCumSales;
		this.pReviewCnt = pReviewCnt;
		this.pRating = pRating;
		this.pRdate = pRdate;
	}
	public ProductDto(String pId, String pName, String pGroup, int pPrice, int pDiscount, String pImage, int pStock,
			String pDescription, Date pRdate) {
		this.pId = pId;
		this.pName = pName;
		this.pGroup = pGroup;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pImage = pImage;
		this.pStock = pStock;
		this.pDescription = pDescription;
		this.pRdate = pRdate;
	}
	

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpGroup() {
		return pGroup;
	}

	public void setpGroup(String pGroup) {
		this.pGroup = pGroup;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpDiscount() {
		return pDiscount;
	}

	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public int getpStock() {
		return pStock;
	}

	public void setpStock(int pStock) {
		this.pStock = pStock;
	}

	public String getpDescription() {
		return pDescription;
	}

	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}

	public int getPcumSales() {
		return pCumSales;
	}

	public void setPcumSales(int pcumSales) {
		this.pCumSales = pcumSales;
	}

	public int getpReviewCnt() {
		return pReviewCnt;
	}

	public void setpReviewCnt(int pReviewCnt) {
		this.pReviewCnt = pReviewCnt;
	}

	public double getpRating() {
		return pRating;
	}

	public void setpRating(double pRating) {
		this.pRating = pRating;
	}

	public Date getpRdate() {
		return pRdate;
	}

	public void setpRdate(Date pRdate) {
		this.pRdate = pRdate;
	}

	@Override
	public String toString() {
		return "ProductDto [pId=" + pId + ", pName=" + pName + ", pGroup=" + pGroup + ", pPrice=" + pPrice
				+ ", pDiscount=" + pDiscount + ", pImage=" + pImage + ", pStock=" + pStock + ", pDescription="
				+ pDescription + ", pcumSales=" + pCumSales + ", pReviewCnt=" + pReviewCnt + ", pRating=" + pRating
				+ ", pRdate=" + pRdate + "]";
	}

}
