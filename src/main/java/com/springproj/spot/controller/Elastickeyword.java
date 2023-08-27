package com.springproj.spot.controller;

import java.time.Instant;
import java.util.Date;

import org.springframework.data.elasticsearch.annotations.Document;

import jdk.jfr.Timestamp;

@Document(indexName = "kword")
public class Elastickeyword { 
	
	private String kword;
	@Timestamp
    private Instant timestamp; // @Timestamp 필드로 저장한 시간
	//Instant는 버전 8이후에 나온 것임. 
	
	public String getKword() {
		return kword;
	}
	public void setKword(String kword) {
		this.kword = kword;
	}
	public Instant getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Instant timestamp) {
		this.timestamp = timestamp;
	}
	
}
