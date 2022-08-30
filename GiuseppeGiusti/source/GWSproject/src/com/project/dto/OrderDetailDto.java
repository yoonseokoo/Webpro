package com.project.dto;

import java.sql.Date;

public class OrderDetailDto {
		private int oDno;
		private String oNo;
		private String pId;
		private String pName;
		private int cartNo;
		private int pPrice;
		private String cartQuantity;
		private String pImage;
		private int pDiscount;
		private Date oDate;
		
		public OrderDetailDto() {
		}

		public OrderDetailDto(int oDno, String oNo, String pId, String pName, int cartNo, int pPrice, String cartQuantity, String pImage,
				int pDiscount, Date oDate) {
			this.oDno = oDno;
			this.oNo = oNo;
			this.pId = pId;
			this.pName = pName;
			this.cartNo = cartNo;
			this.pPrice = pPrice;
			this.cartQuantity = cartQuantity;
			this.pImage = pImage;
			this.pDiscount = pDiscount;
			this.oDate = oDate;
		}
		

		public OrderDetailDto(int oDno, String oNo, String pId, String pName, int pPrice, String cartQuantity,
				String pImage,  Date oDate) {
			super();
			this.oDno = oDno;
			this.oNo = oNo;
			this.pId = pId;
			this.pName = pName;
			this.pPrice = pPrice;
			this.cartQuantity = cartQuantity;
			this.pImage = pImage;
			this.oDate = oDate;
		}

		public int getoDno() {
			return oDno;
		}

		public void setoDno(int oDno) {
			this.oDno = oDno;
		}

		public String getoNo() {
			return oNo;
		}

		public void setoNo(String oNo) {
			this.oNo = oNo;
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

		public int getpPrice() {
			return pPrice;
		}

		public void setpPrice(int pPrice) {
			this.pPrice = pPrice;
		}

		public String getcartQuantity() {
			return cartQuantity;
		}

		public void setcartQuantity(String cartQuantity) {
			this.cartQuantity = cartQuantity;
		}

		public String getpImage() {
			return pImage;
		}

		public void setpImage(String pImage) {
			this.pImage = pImage;
		}

		public int getpDiscount() {
			return pDiscount;
		}

		public void setpDiscount(int pDiscount) {
			this.pDiscount = pDiscount;
		}
	
		public int getCartNo() {
			return cartNo;
		}

		public void setCartNo(int cartNo) {
			this.cartNo = cartNo;
		}

		public Date getoDate() {
			return oDate;
		}

		public void setoDate(Date oDate) {
			this.oDate = oDate;
		}

		@Override
		public String toString() {
			return "OrderDetailDto [oDno=" + oDno + ", oNo=" + oNo + ", pId=" + pId + ", pPrice=" + pPrice
					+ ", cartQuantity=" + cartQuantity + ", pImage=" + pImage + ", pDiscount=" + pDiscount + "]";
		}
}
