package com.springproj.spot.bookmark.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springproj.spot.bookmark.repository.BookMarkVO;
import com.springproj.spot.bookmark.service.BookMakrService;
import com.springproj.spot.repository.TravelSpotVO;
import com.springproj.spot.service.TravelSpotService;
import com.springproj.util.BMPagingVO;

@Controller
@SessionAttributes("bookmark")
public class BookMarkTravelSpotController {

	@Autowired
	BookMakrService bookMarkService;
	TravelSpotService travelSpotService;

	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap") // key
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();

		conditionMap.put("관광지", "PLACE");
		conditionMap.put("주소", "ADDRESS");

		return conditionMap; // value
	}

	// 북마크 리스트
	@RequestMapping(value = "/bookmarklist.do")
	public String getBookMarkTravelList(BMPagingVO vo, Model model,
			@RequestParam(value = "user_seq", required = false) int user_seq,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = bookMarkService.countBoard(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "8";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "8";
		}
		vo = new BMPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), user_seq);
		model.addAttribute("paging", vo);
		model.addAttribute("bookmarklist", bookMarkService.getBookMarkList(vo));
		return "getBookMarkTravelSpotList";
	}

	// 북마크 추가
	@PostMapping(value = "/insertBookmark.do")
	public String insertTravelSpotForm(BookMarkVO vo, TravelSpotVO travelSpotVO, Model model, HttpServletRequest request) {
		// System.out.println(vo);
		
		try{
			int checkMark = bookMarkService.checkBookmark(vo);
			bookMarkService.insertBookmark(vo);
			
			System.out.println(travelSpotVO.getSeq());
			
			String checkseq=null;
			if(travelSpotVO.getSeq() == vo.getSeq_travel()) {
				checkseq = "1"; //동일하면 1셋팅
			} else if(travelSpotVO.getSeq() != vo.getSeq_travel()) {
				checkseq = "0";
			}
			
			//return "redirect:getTravelSpotListuser.do?seq_travel="+vo.getSeq_travel()+"&user_seq="+vo.getUser_seq()+"&checkMark="+checkMark;
			return "redirect:getTravelSpotListuser.do?checkseq="+checkseq+"&checkMark="+checkMark+"&seq_travel="+vo.getSeq_travel();	
			
		}catch(DuplicateKeyException e) {
			int checkMark = bookMarkService.checkBookmark(vo);
			System.out.println(travelSpotVO.getSeq());
			
			System.out.println(checkMark);
			System.out.println("북마크 중복돼서 넣어짐");
			
			String checkseq=null;
			if(travelSpotVO.getSeq() == vo.getSeq_travel()) {
				checkseq = "1"; //동일하면 1셋팅
			} else if(travelSpotVO.getSeq() != vo.getSeq_travel()) {
				checkseq = "0";
			}
			
			//return "redirect:getTravelSpotListuser.do?seq_travel="+vo.getSeq_travel()+"&user_seq="+vo.getUser_seq()+"&checkMark="+checkMark;
			return "redirect:getTravelSpotListuser.do?checkseq="+checkseq+"&checkMark="+checkMark+"&seq_travel="+vo.getSeq_travel();
		}
		
	}

	// 북마크 삭제
	@RequestMapping(value = "/deleteBookmark.do")
	public String deleteTravelSpot(BookMarkVO vo) {
		bookMarkService.deleteBookmark(vo.getSeq_travel());
		return "redirect:bookmarklist.do?user_seq=" + vo.getUser_seq();
	}

}
