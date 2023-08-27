package com.springproj.spot.bookmark.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springproj.util.BMPagingVO;

@Repository("bookDAO")
public class BookMarkDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	// 북마크 등록
	public void insertBookmark(BookMarkVO vo) {
		mybatis.insert("bookmarkDAO.insertBookMark", vo);
	}

	// 북마크 목록 조회
//	public List<BookMarkVO> getBookmarkList(BookMarkVO vo) {
//		return mybatis.selectList("bookmarkDAO.getBookMarkList", vo);
//	}

	// 북마크 삭제
	public void deleteBookmark(int seq_travel) {
		mybatis.delete("bookmarkDAO.deleteBookMark", seq_travel);
	}

	public int countBoard(BMPagingVO vo) {
		return mybatis.selectOne("bookmarkDAO.countBoard",vo);
	}
	
	// 추가코드
	public int checkBookmark(BookMarkVO vo) {
		return mybatis.selectOne("bookmarkDAO.checkBookmark", vo);
	}

	public List<BookMarkVO> getBookmarkList(BMPagingVO vo) {
		return mybatis.selectList("bookmarkDAO.getBookMarkList", vo);
	}

}
