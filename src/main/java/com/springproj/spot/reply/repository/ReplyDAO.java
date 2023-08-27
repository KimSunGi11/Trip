package com.springproj.spot.reply.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springproj.spot.reply.service.ReplyService;
import com.springproj.spot.repository.TravelSpotVO;

@Repository
public class ReplyDAO implements ReplyService {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	//댓글 목록 조회
	public List<ReplyVO> getReplyList(ReplyVO vo) {
		return mybatis.selectList("replyDAO.getReplyList", vo);
	}
	
	//댓글 등록
	public void insertReply(ReplyVO vo) {
		mybatis.insert("replyDAO.insertReply", vo);
	}
	
	//댓글 상세 조회
	public ReplyVO getReply(int reseq) {
		return mybatis.selectOne("replyDAO.getReply", reseq);
	}
	
	//댓글 삭제
	public void deleteReply(int reseq) {
		mybatis.delete("replyDAO.deleteReply", reseq);
	}
	
	//댓글 수정
	public void updateReply(ReplyVO vo) {
		mybatis.update("replyDAO.updateReply", vo);
	}
			
}
