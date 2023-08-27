package com.springproj.spot.service;

import java.util.List;

import com.springproj.spot.repository.TravelSpotVO;
import com.springproj.util.PagingVO;

public interface TravelSpotService {

	// 명소 목록 조회
//	public List<TravelSpotVO> getTravelSpotList(TravelSpotVO vo);
	// 명소 등록
	public void insertTravelSpot(TravelSpotVO vo);

	// 명소 상세 조회
	public TravelSpotVO getTravelSpot(int seq);

	// 명소 수정
	public void updateTravelSpot(TravelSpotVO vo);

	// 명소 삭제
	public void deleteTravelSpot(int seq);

	public int countBoard(PagingVO vo);

	public List<TravelSpotVO> getTravelSpotList(PagingVO vo);

	//public void updateCnt(int seq);
	public void incrementViewCount(int seq);
	
	public List<TravelSpotVO> getTopThree();
}