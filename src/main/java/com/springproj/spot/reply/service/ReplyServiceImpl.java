package com.springproj.spot.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproj.spot.reply.repository.ReplyDAO;
import com.springproj.spot.reply.repository.ReplyVO;
import com.springproj.spot.repository.TravelSpotVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;
	
	@Override
	public List<ReplyVO> getReplyList(ReplyVO vo) {
		return replyDAO.getReplyList(vo);
	}

	@Override
	public void insertReply(ReplyVO vo) {
		replyDAO.insertReply(vo);
	}
	
	@Override
	public ReplyVO getReply(int reseq) {
		return replyDAO.getReply(reseq);
	}
	
	@Override
	public void deleteReply(int reseq) {
		replyDAO.deleteReply(reseq);
	}

	@Override
	public void updateReply(ReplyVO vo) {
		replyDAO.updateReply(vo);
	}
}
