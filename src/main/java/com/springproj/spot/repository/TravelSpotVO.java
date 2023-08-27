package com.springproj.spot.repository;

import org.springframework.web.multipart.MultipartFile;

public class TravelSpotVO {
	private int seq;
	private String place;
	private String address;
	private String content;
	private int likes;
	private int cnt;
	// 파일 업로드를 위해서 스프링이 제공해주는 자료형
	private MultipartFile uploadFile1;
	private MultipartFile uploadFile2;
	private MultipartFile uploadFile3;
	private MultipartFile uploadFile4;
	// DB필드랑 매핑
	private String imageFile1;
	private String imageFile2;
	private String imageFile3;
	private String imageFile4;

	public String toString() {
		String info = "travelSpotVO[seq: " + seq + ", 장소 : " + place + ", 내용 : " + content + ", 좋아요 : " + likes
				+ ", 조회수 : " + cnt + "]";

		return info;

	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	// 파일 첨부 관련
	public MultipartFile getUploadFile1() {
		return uploadFile1;
	}

	public void setUploadFile1(MultipartFile uploadFile1) {
		this.uploadFile1 = uploadFile1;
	}

	public MultipartFile getUploadFile2() {
		return uploadFile2;
	}

	public void setUploadFile2(MultipartFile uploadFile2) {
		this.uploadFile2 = uploadFile2;
	}

	public MultipartFile getUploadFile3() {
		return uploadFile3;
	}

	public void setUploadFile3(MultipartFile uploadFile3) {
		this.uploadFile3 = uploadFile3;
	}

	public MultipartFile getUploadFile4() {
		return uploadFile4;
	}

	public void setUploadFile4(MultipartFile uploadFile4) {
		this.uploadFile4 = uploadFile4;
	}

	public String getImageFile1() {
		return imageFile1;
	}

	public void setImageFile1(String imageFile1) {
		this.imageFile1 = imageFile1;
	}

	public String getImageFile2() {
		return imageFile2;
	}

	public void setImageFile2(String imageFile2) {
		this.imageFile2 = imageFile2;
	}

	public String getImageFile3() {
		return imageFile3;
	}

	public void setImageFile3(String imageFile3) {
		this.imageFile3 = imageFile3;
	}

	public String getImageFile4() {
		return imageFile4;
	}

	public void setImageFile4(String imageFile4) {
		this.imageFile4 = imageFile4;
	}

}
