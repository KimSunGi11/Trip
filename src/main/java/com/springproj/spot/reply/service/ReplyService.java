package com.springproj.spot.reply.service;

import java.util.List;

import com.springproj.spot.reply.repository.ReplyVO;
import com.springproj.spot.repository.TravelSpotVO;

public interface ReplyService {
	//댓글 목록 조회
	public List<ReplyVO> getReplyList(ReplyVO vo);
	//댓글 등록
	public void insertReply(ReplyVO vo);
	//댓글 상세 조회
	public ReplyVO getReply(int reseq);
	//댓글 삭제
	public void deleteReply(int reseq);
	//댓글 수정
	public void updateReply(ReplyVO vo);
}
