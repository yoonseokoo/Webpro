package com.project.dto;

public class CartDto {
	private int cartNo;
	private String mId;
	private String pId;
	private String pName;
	private String pImage;
	private int pStock;
	private int pPrice;
	private int pDiscount;
	private String cartQuantity;
	
	
	public CartDto() {
	}
	

	
	public CartDto(int cartNo, String cartQuantity) {
		super();
		this.cartNo = cartNo;
		this.cartQuantity = cartQuantity;
	}



	public CartDto(int cartNo, String mId, String pId, String pName, String pImage, int pStock, int pPrice,
			int pDiscount, String cartQuantity) {
		super();
		this.cartNo = cartNo;
		this.mId = mId;
		this.pId = pId;
		this.pName = pName;
		this.pImage = pImage;
		this.pStock = pStock;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.cartQuantity = cartQuantity;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
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


	public String getCartQuantity() {
		return cartQuantity;
	}


	public void setCartQuantity(String cartQuantity) {
		this.cartQuantity = cartQuantity;
	}


	@Override
	public String toString() {
		return "CartDto [cartNo=" + cartNo + ", mId=" + mId + ", pId=" + pId + ", pName=" + pName + ", pImage=" + pImage
				+  ", pStock=" + pStock + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + "]";
	}


	
	
	
	
}