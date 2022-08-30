package com.project.dto;

import java.sql.Date;

public class OrdersDto {
		private String oNo;
		private String oName;
		private String oAddress;
		private String oAddressDetail;
		private String oPhone;
		private String oNote;
		private Date oDate;
		private String mId;
		
		
		
		public OrdersDto() {
		}


		public OrdersDto(String oNo, String oName, String oAddress, String oAddressDetail, String oPhone, String oNote, Date oDate,
				String mId) {
			this.oNo = oNo;
			this.oName = oName;
			this.oAddress = oAddress;
			this.oAddressDetail = oAddressDetail;
			this.oPhone = oPhone;
			this.oNote = oNote;
			this.oDate = oDate;
			this.mId = mId;
		}


		public String getoNo() {
			return oNo;
		}


		public void setoNo(String oNo) {
			this.oNo = oNo;
		}


		public String getoName() {
			return oName;
		}


		public void setoName(String oName) {
			this.oName = oName;
		}


		public String getoAddress() {
			return oAddress;
		}


		public void setoAddress(String oAddress) {
			this.oAddress = oAddress;
		}


		public String getoAddressDetail() {
			return oAddressDetail;
		}


		public void setmAddressDetail(String oAddressDetail) {
			this.oAddressDetail = oAddressDetail;
		}


		public String getoPhone() {
			return oPhone;
		}


		public void setoPhone(String oPhone) {
			this.oPhone = oPhone;
		}


		public Date getoDate() {
			return oDate;
		}


		public void setoDate(Date oDate) {
			this.oDate = oDate;
		}


		public String getmId() {
			return mId;
		}


		public void setmId(String mId) {
			this.mId = mId;
		}


		public String getoNote() {
			return oNote;
		}


		public void setoNote(String oNote) {
			this.oNote = oNote;
		}


		@Override
		public String toString() {
			return "OrderDto [oNo=" + oNo + ", oName=" + oName + ", oAddress=" + oAddress + ", oAddressDetail="
					+ oAddressDetail + ", oPhone=" + oPhone + ", oNote=" + oNote + ", oDate=" + oDate + ", mId=" + mId
					+ "]";
		}
}
