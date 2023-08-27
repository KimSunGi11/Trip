package com.springproj.spot.reply.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.springproj.spot.reply.repository.ReplyVO;
import com.springproj.spot.reply.service.ReplyService;

@Controller
@SessionAttributes("reply")
public class ReplyController {
	@Autowired
	ReplyService replyService;

	// 댓글 목록 보기
	@RequestMapping(value = "/getReplyList.do")
	public String getReplyList(ReplyVO vo, Model model, HttpSession session) {

		// List<ReplyVO> list = replyService.getReplyList(vo);
		// model.addAttribute("replyList", list);
		return "redirect:getTravelSpotuser.do?seq=" + vo.getSeq();
	}

	@PostMapping(value = "/insertReply.do")
	public String insertReply(ReplyVO vo, HttpSession session) {

		// 파일 업로드 처리
		String fileSaveFolder = session.getServletContext().getRealPath("/boardUpload/user/");

		MultipartFile uploadFile1 = vo.getUploadFile1();
		MultipartFile uploadFile2 = vo.getUploadFile2();
		MultipartFile uploadFile3 = vo.getUploadFile3();
		MultipartFile uploadFile4 = vo.getUploadFile4();

		vo.setImage1("");
		System.out.println(vo.getImage1());
		vo.setImage2("");
		vo.setImage3("");
		vo.setImage4("");

		String fileName1 = uploadFile1.getOriginalFilename();
		System.out.println(fileName1);
		String fileName2 = uploadFile2.getOriginalFilename();
		System.out.println(fileName2);
		String fileName3 = uploadFile3.getOriginalFilename();
		System.out.println(fileName3);
		String fileName4 = uploadFile4.getOriginalFilename();
		System.out.println(fileName4);

		try {
			if (!uploadFile1.isEmpty() || !uploadFile2.isEmpty() || !uploadFile3.isEmpty() || !uploadFile4.isEmpty()) {

				if (fileName1 != "") {
					String[] fileSplit1 = StringUtils.split(fileName1, ".");
					String fullname1 = fileSplit1[0] + "_" + session.getAttribute("id") + "." + fileSplit1[1];

					uploadFile1.transferTo(new File(fileSaveFolder + fullname1));
					vo.setImage1(fullname1);
				}
				if (fileName2 != "") {
					String[] fileSplit2 = StringUtils.split(fileName2, ".");
					String fullname2 = fileSplit2[0] + "_" + session.getAttribute("id") + "." + fileSplit2[1];

					uploadFile2.transferTo(new File(fileSaveFolder + fullname2));
					vo.setImage2(fullname2);
				}
				if (fileName3 != "") {
					String[] fileSplit3 = StringUtils.split(fileName3, ".");
					String fullname3 = fileSplit3[0] + "_" + session.getAttribute("id") + "." + fileSplit3[1];

					uploadFile3.transferTo(new File(fileSaveFolder + fullname3));
					vo.setImage3(fullname3);
				}
				if (fileName4 != "") {
					String[] fileSplit4 = StringUtils.split(fileName4, ".");
					String fullname4 = fileSplit4[0] + "_" + session.getAttribute("id") + "." + fileSplit4[1];

					uploadFile4.transferTo(new File(fileSaveFolder + fullname4));
					vo.setImage4(fullname4);
				}

				/*
				uploadFile1.transferTo(new File(fileSaveFolder+fileName1));
				vo.setImage1(fileName1);
				uploadFile2.transferTo(new File(fileSaveFolder+fileName2));
				vo.setImage2(fileName2);
				uploadFile3.transferTo(new File(fileSaveFolder+fileName3));
				vo.setImage3(fileName3);
				uploadFile4.transferTo(new File(fileSaveFolder+fileName4));
				vo.setImage4(fileName4);
				*/
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		replyService.insertReply(vo);

		return "redirect:getTravelSpot.do?seq=" + vo.getSeq();
	}
	
	//user 데이터 추가 처리
	@PostMapping(value = "/insertReplyuser.do")
	public String insertReplyuser(ReplyVO vo, HttpSession session) {
		
		// 파일 업로드 처리
		String fileSaveFolder = session.getServletContext().getRealPath("/boardUpload/user/");

		MultipartFile uploadFile1 = vo.getUploadFile1();
		MultipartFile uploadFile2 = vo.getUploadFile2();
		MultipartFile uploadFile3 = vo.getUploadFile3();
		MultipartFile uploadFile4 = vo.getUploadFile4();

		vo.setImage1("");
		System.out.println(vo.getImage1());
		vo.setImage2("");
		vo.setImage3("");
		vo.setImage4("");

		String fileName1 = uploadFile1.getOriginalFilename();
		System.out.println(fileName1);
		String fileName2 = uploadFile2.getOriginalFilename();
		System.out.println(fileName2);
		String fileName3 = uploadFile3.getOriginalFilename();
		System.out.println(fileName3);
		String fileName4 = uploadFile4.getOriginalFilename();
		System.out.println(fileName4);

		try {
			if (!uploadFile1.isEmpty() || !uploadFile2.isEmpty() || !uploadFile3.isEmpty() || !uploadFile4.isEmpty()) {

				if (fileName1 != "") {
					String[] fileSplit1 = StringUtils.split(fileName1, ".");
					String fullname1 = fileSplit1[0] + "_" + session.getAttribute("id") + "." + fileSplit1[1];

					uploadFile1.transferTo(new File(fileSaveFolder + fullname1));
					vo.setImage1(fullname1);
				}
				if (fileName2 != "") {
					String[] fileSplit2 = StringUtils.split(fileName2, ".");
					String fullname2 = fileSplit2[0] + "_" + session.getAttribute("id") + "." + fileSplit2[1];

					uploadFile2.transferTo(new File(fileSaveFolder + fullname2));
					vo.setImage2(fullname2);
				}
				if (fileName3 != "") {
					String[] fileSplit3 = StringUtils.split(fileName3, ".");
					String fullname3 = fileSplit3[0] + "_" + session.getAttribute("id") + "." + fileSplit3[1];

					uploadFile3.transferTo(new File(fileSaveFolder + fullname3));
					vo.setImage3(fullname3);
				}
				if (fileName4 != "") {
					String[] fileSplit4 = StringUtils.split(fileName4, ".");
					String fullname4 = fileSplit4[0] + "_" + session.getAttribute("id") + "." + fileSplit4[1];

					uploadFile4.transferTo(new File(fileSaveFolder + fullname4));
					vo.setImage4(fullname4);
				}

				/*
				uploadFile1.transferTo(new File(fileSaveFolder+fileName1));
				vo.setImage1(fileName1);
				uploadFile2.transferTo(new File(fileSaveFolder+fileName2));
				vo.setImage2(fileName2);
				uploadFile3.transferTo(new File(fileSaveFolder+fileName3));
				vo.setImage3(fileName3);
				uploadFile4.transferTo(new File(fileSaveFolder+fileName4));
				vo.setImage4(fileName4);
				*/
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		replyService.insertReply(vo);
		
		return "redirect:getTravelSpotuser.do?seq=" + vo.getSeq();
	}
	
	// 댓글 삭제:관리자
	@RequestMapping("/deleteReply.do")
	public String deleteReply(ReplyVO vo) {

		replyService.deleteReply(vo.getReseq());
		
		return "redirect:getTravelSpot.do?seq=" + vo.getSeq();

	}
	
	// 댓글 삭제:user
		@RequestMapping("/deleteReplyuser.do")
		public String deleteReplyuser(ReplyVO vo) {

			replyService.deleteReply(vo.getReseq());
			
			return "redirect:getTravelSpotuser.do?seq=" + vo.getSeq();

		}

	// 댓글 수정화면:관리자
	@RequestMapping(value = "/updateReply.do", method = RequestMethod.GET)
	public String updateReplyForm(ReplyVO vo, Model model) {
		
		ReplyVO reply = replyService.getReply(vo.getReseq());
		model.addAttribute("reply", reply);
		System.out.println(reply);

		return "replyUpdateForm";
	}
	// 댓글 수정화면:user
	@RequestMapping(value = "/updateReplyuser.do", method = RequestMethod.GET)
	public String updateReplyuserForm(ReplyVO vo, Model model) {

		ReplyVO reply = replyService.getReply(vo.getReseq());
		model.addAttribute("reply", reply);
		System.out.println(reply);

		return "replyUpdateFormUser";
	}

	// 댓글 수정 처리: 관리자
	@RequestMapping(value = "/updateReply.do", method = RequestMethod.POST)
	public String updateReplyProc(@ModelAttribute("reply") ReplyVO vo, HttpSession session) {

		// 파일 업로드 처리
		String fileSaveFolder = session.getServletContext().getRealPath("/boardUpload/user/");

		MultipartFile uploadFile1 = vo.getUploadFile1();
		MultipartFile uploadFile2 = vo.getUploadFile2();
		MultipartFile uploadFile3 = vo.getUploadFile3();
		MultipartFile uploadFile4 = vo.getUploadFile4();

		vo.setImage1("");
		System.out.println(vo.getImage1());
		vo.setImage2("");
		vo.setImage3("");
		vo.setImage4("");

		String fileName1 = uploadFile1.getOriginalFilename();
		System.out.println(fileName1);
		String fileName2 = uploadFile2.getOriginalFilename();
		System.out.println(fileName2);
		String fileName3 = uploadFile3.getOriginalFilename();
		System.out.println(fileName3);
		String fileName4 = uploadFile4.getOriginalFilename();
		System.out.println(fileName4);

		try {
			if (!uploadFile1.isEmpty() || !uploadFile2.isEmpty() || !uploadFile3.isEmpty() || !uploadFile4.isEmpty()) {

				if (fileName1 != "") {
					String[] fileSplit1 = StringUtils.split(fileName1, ".");
					String fullname1 = fileSplit1[0] + "_" + session.getAttribute("id") + "." + fileSplit1[1];

					uploadFile1.transferTo(new File(fileSaveFolder + fullname1));
					vo.setImage1(fullname1);
				}
				if (fileName2 != "") {
					String[] fileSplit2 = StringUtils.split(fileName2, ".");
					String fullname2 = fileSplit2[0] + "_" + session.getAttribute("id") + "." + fileSplit2[1];

					uploadFile2.transferTo(new File(fileSaveFolder + fullname2));
					vo.setImage2(fullname2);
				}
				if (fileName3 != "") {
					String[] fileSplit3 = StringUtils.split(fileName3, ".");
					String fullname3 = fileSplit3[0] + "_" + session.getAttribute("id") + "." + fileSplit3[1];

					uploadFile3.transferTo(new File(fileSaveFolder + fullname3));
					vo.setImage3(fullname3);
				}
				if (fileName4 != "") {
					String[] fileSplit4 = StringUtils.split(fileName4, ".");
					String fullname4 = fileSplit4[0] + "_" + session.getAttribute("id") + "." + fileSplit4[1];

					uploadFile4.transferTo(new File(fileSaveFolder + fullname4));
					vo.setImage4(fullname4);
				}

				/*
				uploadFile1.transferTo(new File(fileSaveFolder+fileName1));
				vo.setImage1(fileName1);
				uploadFile2.transferTo(new File(fileSaveFolder+fileName2));
				vo.setImage2(fileName2);
				uploadFile3.transferTo(new File(fileSaveFolder+fileName3));
				vo.setImage3(fileName3);
				uploadFile4.transferTo(new File(fileSaveFolder+fileName4));
				vo.setImage4(fileName4);
				*/
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		replyService.updateReply(vo);

		return "redirect:getTravelSpot.do?seq=" + vo.getSeq();
	}
	
	// 댓글 수정 처리: user
	@RequestMapping(value = "/updateReplyuser.do", method = RequestMethod.POST)
	public String updateReplyuserProc(@ModelAttribute("reply") ReplyVO vo, HttpSession session) {

		// 파일 업로드 처리
		String fileSaveFolder = session.getServletContext().getRealPath("/boardUpload/user/");

		MultipartFile uploadFile1 = vo.getUploadFile1();
		MultipartFile uploadFile2 = vo.getUploadFile2();
		MultipartFile uploadFile3 = vo.getUploadFile3();
		MultipartFile uploadFile4 = vo.getUploadFile4();

		vo.setImage1("");
		System.out.println(vo.getImage1());
		vo.setImage2("");
		vo.setImage3("");
		vo.setImage4("");

		String fileName1 = uploadFile1.getOriginalFilename();
		System.out.println(fileName1);
		String fileName2 = uploadFile2.getOriginalFilename();
		System.out.println(fileName2);
		String fileName3 = uploadFile3.getOriginalFilename();
		System.out.println(fileName3);
		String fileName4 = uploadFile4.getOriginalFilename();
		System.out.println(fileName4);

		try {
			if (!uploadFile1.isEmpty() || !uploadFile2.isEmpty() || !uploadFile3.isEmpty() || !uploadFile4.isEmpty()) {

				if (fileName1 != "") {
					String[] fileSplit1 = StringUtils.split(fileName1, ".");
					String fullname1 = fileSplit1[0] + "_" + session.getAttribute("id") + "." + fileSplit1[1];

					uploadFile1.transferTo(new File(fileSaveFolder + fullname1));
					vo.setImage1(fullname1);
				}
				if (fileName2 != "") {
					String[] fileSplit2 = StringUtils.split(fileName2, ".");
					String fullname2 = fileSplit2[0] + "_" + session.getAttribute("id") + "." + fileSplit2[1];

					uploadFile2.transferTo(new File(fileSaveFolder + fullname2));
					vo.setImage2(fullname2);
				}
				if (fileName3 != "") {
					String[] fileSplit3 = StringUtils.split(fileName3, ".");
					String fullname3 = fileSplit3[0] + "_" + session.getAttribute("id") + "." + fileSplit3[1];

					uploadFile3.transferTo(new File(fileSaveFolder + fullname3));
					vo.setImage3(fullname3);
				}
				if (fileName4 != "") {
					String[] fileSplit4 = StringUtils.split(fileName4, ".");
					String fullname4 = fileSplit4[0] + "_" + session.getAttribute("id") + "." + fileSplit4[1];

					uploadFile4.transferTo(new File(fileSaveFolder + fullname4));
					vo.setImage4(fullname4);
				}

				/*
				uploadFile1.transferTo(new File(fileSaveFolder+fileName1));
				vo.setImage1(fileName1);
				uploadFile2.transferTo(new File(fileSaveFolder+fileName2));
				vo.setImage2(fileName2);
				uploadFile3.transferTo(new File(fileSaveFolder+fileName3));
				vo.setImage3(fileName3);
				uploadFile4.transferTo(new File(fileSaveFolder+fileName4));
				vo.setImage4(fileName4);
				*/
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		replyService.updateReply(vo);

		return "redirect:getTravelSpotuser.do?seq=" + vo.getSeq();
	}

}
