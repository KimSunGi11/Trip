package com.springproj.spot.reply.repository;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReplyVO {
	private int seq;
	private int reseq;
	private String writer;
	private String content;
	private Date regDate;
	//파일 업로드를 위해서 스프링이 제공해주는 자료형
	private MultipartFile uploadFile1;
	private MultipartFile uploadFile2;
	private MultipartFile uploadFile3;
	private MultipartFile uploadFile4;
	
	//DB필드랑 매핑
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getReseq() {
		return reseq;
	}
	public void setReseq(int reseq) {
		this.reseq = reseq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	//사용자 사진 첨부
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
	
	
	
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getImage4() {
		return image4;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	
}
