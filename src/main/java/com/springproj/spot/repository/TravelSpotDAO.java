package com.springproj.spot.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springproj.spot.reply.repository.ReplyVO;
import com.springproj.spot.service.TravelSpotService;
import com.springproj.util.PagingVO;

@Repository
public class TravelSpotDAO implements TravelSpotService {

	@Autowired
	SqlSessionTemplate mybatis;

	// 명소 등록
	public void insertTravelSpot(TravelSpotVO vo) {
		mybatis.insert("spotDAO.insertTravelSpot", vo);
	}

	// 명소 상세 조회
	public TravelSpotVO getTravelSpot(int seq) {
		return mybatis.selectOne("spotDAO.getTravelSpot", seq);
	}

	// 명소 내용 수정
	public void updateTravelSpot(TravelSpotVO vo) {
		mybatis.update("spotDAO.updateTravelSpot", vo);
	}

	// 조회수 수정
//	public void updateCnt(int seq) {
//		mybatis.update("spotDAO.updateCnt", seq);
//	}

	// 명소 삭제
	public void deleteTravelSpot(int seq) {
		mybatis.delete("spotDAO.deleteTravelSpot", seq);
	}

	// 조회수
	public void incrementViewCount(int cnt) {
		mybatis.update("spotDAO.incrementViewCount", cnt);
	}

	@Override
	public int countBoard(PagingVO vo) {
		return mybatis.selectOne("spotDAO.countBoard",vo);
	}

	@Override
	public List<TravelSpotVO> getTravelSpotList(PagingVO vo) {
		return mybatis.selectList("spotDAO.getTravelSpotList", vo);
	}

	public List<TravelSpotVO> getTopThree() {
		return mybatis.selectList("spotDAO.selectTopThree");
	}

}
