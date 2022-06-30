package com.project.dto;

import java.sql.Date;

public class MemberDto {
	private String mId;
	private String mPw;
	private String mName;
	private String mPhone;
	private String mAddress;
	private String mAddressDetail;
	private Date mBirth;
	private String mEmail;
	private String mGender;
	private int mCumPurchase;
	private Date mRdate;
	private int mGrade;
	
	public MemberDto() {
	}
	
	
	public MemberDto(String mId, String mPw, String mName, String mPhone, String mAddress, String mAddressDetail,
			Date mBirth, String mEmail, String mGender, int mCumPurchase, Date mRdate, int mGrade) {
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
		this.mAddressDetail = mAddressDetail;
		this.mBirth = mBirth;
		this.mEmail = mEmail;
		this.mGender = mGender;
		this.mCumPurchase = mCumPurchase;
		this.mRdate = mRdate;
		this.mGrade = mGrade;
		
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmAddress() {
		return mAddress;
	}

	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}

	public String getmAddressDetail() {
		return mAddressDetail;
	}

	public void setmAddressDetail(String mAddressDetail) {
		this.mAddressDetail = mAddressDetail;
	}

	public Date getmBirth() {
		return mBirth;
	}

	public void setmBirth(Date mBirth) {
		this.mBirth = mBirth;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public int getmCumPurchase() {
		return mCumPurchase;
	}

	public void setmCumPurchase(int mCumPurchase) {
		this.mCumPurchase = mCumPurchase;
	}

	public Date getmRdate() {
		return mRdate;
	}

	public void setmRdate(Date mRdate) {
		this.mRdate = mRdate;
	}

	public int getmGrade() {
		return mGrade;
	}

	public void setmGrade(int mGrade) {
		this.mGrade = mGrade;
	}

	@Override
	public String toString() {
		return "MemberDto [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mPhone=" + mPhone + ", mAddress="
				+ mAddress + ", mAddressDetail=" + mAddressDetail + ", mBirth=" + mBirth + ", mEmail=" + mEmail
				+ ", mGender=" + mGender + ", mCumPurchase=" + mCumPurchase + ", mRdate=" + mRdate + ", mGrade="
				+ mGrade + "]";
	}

	
}
