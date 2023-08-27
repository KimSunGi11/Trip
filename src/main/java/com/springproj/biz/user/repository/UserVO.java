package com.springproj.biz.user.repository;

public class UserVO {
	private int MEMBER_SEQ;
	private String MEMBER_ID;
	private String MEMBER_PW;
	private String MEMBER_NAME;
	private String MEMBER_PHONE;
	private String MEMBER_EMAIL;
	private String MEMBER_EMAIL_GET;
	private String MEMBER_ADDR1;// 주소
	private String MEMBER_ZIPCODE1;// 우편번호1
	private String MEMBER_ZIPCODE2;// 우편번호2

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getMEMBER_PW() {
		return MEMBER_PW;
	}

	public void setMEMBER_PW(String mEMBER_PW) {
		MEMBER_PW = mEMBER_PW;
	}

	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}

	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}

	public String getMEMBER_PHONE() {
		return MEMBER_PHONE;
	}

	public void setMEMBER_PHONE(String mEMBER_PHONE) {
		MEMBER_PHONE = mEMBER_PHONE;
	}

	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}

	public void setMEMBER_EMAIL(String mEMBER_EMAIL) {
		MEMBER_EMAIL = mEMBER_EMAIL;
	}

	public String getMEMBER_EMAIL_GET() {
		return MEMBER_EMAIL_GET;
	}

	public void setMEMBER_EMAIL_GET(String mEMBER_EMAIL_GET) {
		MEMBER_EMAIL_GET = mEMBER_EMAIL_GET;
	}

	public String getMEMBER_ADDR1() {
		return MEMBER_ADDR1;
	}

	public void setMEMBER_ADDR1(String mEMBER_ADDR1) {
		MEMBER_ADDR1 = mEMBER_ADDR1;
	}

	public String getMEMBER_ZIPCODE1() {
		return MEMBER_ZIPCODE1;
	}

	public void setMEMBER_ZIPCODE1(String mEMBER_ZIPCODE1) {
		MEMBER_ZIPCODE1 = mEMBER_ZIPCODE1;
	}

	public String getMEMBER_ZIPCODE2() {
		return MEMBER_ZIPCODE2;
	}

	public void setMEMBER_ZIPCODE2(String mEMBER_ZIPCODE2) {
		MEMBER_ZIPCODE2 = mEMBER_ZIPCODE2;
	}

	public int getMEMBER_SEQ() {
		return MEMBER_SEQ;
	}

	public void setMEMBER_SEQ(int mEMBER_SEQ) {
		MEMBER_SEQ = mEMBER_SEQ;
	}

}
