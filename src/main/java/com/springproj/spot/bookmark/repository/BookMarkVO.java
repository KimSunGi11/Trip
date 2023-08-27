package com.springproj.spot.bookmark.repository;

public class BookMarkVO {
	private int seq_travel;
	private int user_seq;
	private String place_travel;
	private String content_travel;
	private String address_travel;

	
	public String getAddress_travel() {
		return address_travel;
	}

	public void setAddress_travel(String address_travel) {
		this.address_travel = address_travel;
	}

	public int getSeq_travel() {
		return seq_travel;
	}

	public void setSeq_travel(int seq_travel) {
		this.seq_travel = seq_travel;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public String getPlace_travel() {
		return place_travel;
	}

	public void setPlace_travel(String place_travel) {
		this.place_travel = place_travel;
	}

	public String getContent_travel() {
		return content_travel;
	}

	public void setContent_travel(String content_travel) {
		this.content_travel = content_travel;
	}

}
