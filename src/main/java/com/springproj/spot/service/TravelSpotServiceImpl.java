package com.springproj.spot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproj.spot.reply.repository.ReplyVO;
import com.springproj.spot.repository.TravelSpotDAO;
import com.springproj.spot.repository.TravelSpotVO;
import com.springproj.util.PagingVO;

@Service("travelSpotService")
public class TravelSpotServiceImpl implements TravelSpotService {

	@Autowired
	private TravelSpotDAO travelDAO;

	@Override
	public List<TravelSpotVO> getTravelSpotList(PagingVO vo) {
		return travelDAO.getTravelSpotList(vo);
	}

	@Override
	public void insertTravelSpot(TravelSpotVO vo) {
		travelDAO.insertTravelSpot(vo);
	}

	@Override
	public TravelSpotVO getTravelSpot(int seq) {
		return travelDAO.getTravelSpot(seq);
	}

	@Override
	public void updateTravelSpot(TravelSpotVO vo) {
		travelDAO.updateTravelSpot(vo);
	}

	@Override
	public void deleteTravelSpot(int seq) {
		travelDAO.deleteTravelSpot(seq);
	}

	@Override
	public int countBoard(PagingVO vo) {
		return travelDAO.countBoard(vo);
	}

//	public void updateCnt(int seq) {
//		travelDAO.updateCnt(seq);
//	}
	@Override
	public void incrementViewCount(int cnt) {
		travelDAO.incrementViewCount(cnt);

	}

	public List<TravelSpotVO> getTopThree() {
		return travelDAO.getTopThree();
	}

}
