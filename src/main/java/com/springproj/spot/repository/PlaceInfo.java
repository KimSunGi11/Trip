package com.springproj.spot.repository;

public class PlaceInfo {
	private int seq;
    private double latitude;
    private double longitude;
    private String place;

    public PlaceInfo(int seq, double latitude, double longitude, String place) {
    	this.seq = seq;
        this.latitude = latitude;
        this.longitude = longitude;
        this.place = place;
    }

    public int getSeq() {
        return seq;
    }
    
    public double getLatitude() {
        return latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public String getPlace() {
        return place;
    }
}