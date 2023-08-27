package com.springproj.spot.bookmark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproj.spot.bookmark.repository.BookMarkDAO;
import com.springproj.spot.bookmark.repository.BookMarkVO;
import com.springproj.util.BMPagingVO;

@Service("bookMarkService")
public class BookMarkServiceImpl implements BookMakrService {
	@Autowired
	private BookMarkDAO bookDAO;

	public void insertBookmark(BookMarkVO vo) {
		bookDAO.insertBookmark(vo);
	}

	// public List<BookMarkVO> getBookmarkList(BookMarkVO vo) {
	// return bookDAO.getBookmarkList(vo);
	// }

	public void deleteBookmark(int seq) {
		bookDAO.deleteBookmark(seq);
	}

	@Override
	public int countBoard(BMPagingVO vo) {
		return bookDAO.countBoard(vo);
	}

	@Override
	public List<BookMarkVO> getBookMarkList(BMPagingVO vo) {
		return bookDAO.getBookmarkList(vo);
	}

	@Override
	public int checkBookmark(BookMarkVO vo) {
		return bookDAO.checkBookmark(vo);
	}

}
