package com.springproj.spot.likes.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springproj.spot.likes.service.LikesService;
import com.springproj.spot.repository.TravelSpotVO;

@Repository("likesDAO")
public class LikesDAO implements LikesService{

	@Autowired
	SqlSessionTemplate mybatis;
	
	/*
	//특정 게시물 좋아요 누른 사람 몇명인지 구함
	@Override
	public int checkLikes(LikesVO vo) {
		return mybatis.selectOne("likesDAO.checkLikes", vo);
	}
	
	@Override
	public int likesCnt(int seq) {
		
		return mybatis.selectOne("likesDAO.likesCnt", seq);
	}
	*/
	
	//동일한 정보가 있는지 확인 => 하나의 레코드 반환
	public int checkLikeSelect(LikesVO vo) {
		return mybatis.selectOne("likesDAO.checkLikeSelect", vo);
	}
	
	
	@Override
	public void upLike(TravelSpotVO vo) {
		mybatis.update("likesDAO.upLike", vo);	
	}

	@Override
	public void insertLikesInfo(LikesVO vo) {
		
		mybatis.insert("likesDAO.insertLikesInfo", vo);
	}

	@Override
	public void downLike(TravelSpotVO vo) {
		
		mybatis.update("likesDAO.downLike", vo);
	}

	@Override
	public void deleteLikesInfo(LikesVO vo) {
		
		mybatis.delete("likesDAO.deleteLikesInfo", vo);
	}
		

}
