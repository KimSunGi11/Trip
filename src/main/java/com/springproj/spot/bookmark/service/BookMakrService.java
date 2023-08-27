package com.springproj.spot.bookmark.service;

import java.util.List;

import com.springproj.spot.bookmark.repository.BookMarkVO;
import com.springproj.spot.repository.TravelSpotVO;
import com.springproj.util.BMPagingVO;
import com.springproj.util.PagingVO;

public interface BookMakrService {

	void insertBookmark(BookMarkVO vo);

//	List<BookMarkVO> getBookmarkList(BookMarkVO vo);

	void deleteBookmark(int seq);

	public int countBoard(BMPagingVO vo);

	List<BookMarkVO> getBookMarkList(BMPagingVO vo);
	
	public int checkBookmark(BookMarkVO vo);

}