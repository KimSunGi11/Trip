package com.springproj.spot.likes.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springproj.spot.likes.repository.LikesVO;
import com.springproj.spot.likes.service.LikesService;
import com.springproj.spot.repository.TravelSpotVO;
import com.springproj.spot.service.TravelSpotService;

@Controller
@SessionAttributes("likes")
public class LikesController {
	@Autowired
	LikesService likesService;
	@Autowired
	TravelSpotService travelSpotService;

	// board like
	// @ResponseBody
	@RequestMapping(value = "/spotLikes.do")
	public String spotLikes(LikesVO vo, TravelSpotVO travelSpotVO, Model model, HttpSession session) {

		if (vo.getMEMBER_ID() != "") {

			int result = likesService.checkLikeSelect(vo);

			if (result == 1) { // 삭제해야함. 같음.
				likesService.downLike(travelSpotVO); // 숫자 하나 뺌
				likesService.deleteLikesInfo(vo); // 삭제됨
				// return해서 이미지 변경하게 => 빈하트
			} else if (result == 0) {
				likesService.upLike(travelSpotVO); // 숫자 하나 더함.
				likesService.insertLikesInfo(vo); // 추가됨
			}

			// DB에 변화가됨
			// UI에 현재 상태에 대한 번호를 전송해야함.
			// System.out.println(result);
			session.setAttribute("result", result);
			
			if(session.getAttribute("id").equals("admin")) {
				return "redirect:getTravelSpot.do?seq=" + travelSpotVO.getSeq();
			} else {
				return "redirect:getTravelSpotuser.do?seq=" + travelSpotVO.getSeq();
			}	

		} else { // if(vo.getMEMBER_ID() == "")
			System.out.println("회원정보가 없습니다.");

			return "redirect:getTravelSpotNonUser.do?seq=" + travelSpotVO.getSeq();

		}

		// 세션영역에 result데이터가 저장되고 있음!!
		// return null;

	}

}
