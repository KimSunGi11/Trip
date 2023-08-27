package com.springproj.spot.likes.service;

import com.springproj.spot.likes.repository.LikesVO;
import com.springproj.spot.repository.TravelSpotVO;

public interface LikesService {
	//public int checkLikes(LikesVO vo);			

	public void upLike(TravelSpotVO vo);

	public void insertLikesInfo(LikesVO vo);

	public void downLike(TravelSpotVO vo);

	public void deleteLikesInfo(LikesVO vo);

	//public int likesCnt(int seq);
	
	
	//추가
	public int checkLikeSelect(LikesVO vo);
}
