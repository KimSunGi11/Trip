package com.springproj.spot.likes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproj.spot.likes.repository.LikesDAO;
import com.springproj.spot.likes.repository.LikesVO;
import com.springproj.spot.repository.TravelSpotVO;

@Service("likesService")
public class LikesServiceImpl implements LikesService{
	
	@Autowired
	private LikesDAO likesDAO;
	
	/*
	@Override
	public int checkLikes(LikesVO vo) {
		return likesDAO.checkLikes(vo);
	}
	*/
	

	@Override
	public void upLike(TravelSpotVO vo) {
		likesDAO.upLike(vo);
	}

	@Override
	public void insertLikesInfo(LikesVO vo) {
		likesDAO.insertLikesInfo(vo);
	}

	@Override
	public void downLike(TravelSpotVO vo) {
		likesDAO.downLike(vo);
	}

	@Override
	public void deleteLikesInfo(LikesVO vo) {
		likesDAO.deleteLikesInfo(vo);
	}
	
	/*
	@Override
	public int likesCnt(int seq) {
		return likesDAO.likesCnt(seq);
	}
	*/

	@Override
	public int checkLikeSelect(LikesVO vo) {
		return likesDAO.checkLikeSelect(vo);
	}

}
