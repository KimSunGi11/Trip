package com.springproj.prz.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springproj.biz.user.repository.UserVO;
import com.springproj.biz.user.service.UserService;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@Autowired
	private JavaMailSender mailSender;

	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap") // key
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();

		conditionMap.put("관광지", "PLACE");
		conditionMap.put("주소", "ADDRESS");

		return conditionMap; // value
	}

	// 로그인 GET
	@GetMapping(value = "/login.me") // 4.3 이후 버전
	public String loginForm(@ModelAttribute("usr") UserVO vo) {

		vo.setMEMBER_ID("test");
		vo.setMEMBER_PW("test1234");

		return "login";
	}

	// 로그인 POST
	@PostMapping(value = "/login.me") // 4.3 이후 버전
	public String loginProc(UserVO vo, HttpSession session) {

		if (vo.getMEMBER_ID() == null || vo.getMEMBER_ID().equals("")) {
			throw new ArithmeticException("아이디는 반드시 입력해야 합니다.");
		}

		String retVal = null;
		UserVO user = userService.getUser(vo);
		System.out.println(user);
		if ((user != null) && (user.getMEMBER_PW().equals(vo.getMEMBER_PW()))) {
			System.out.println(user);
			session.setAttribute("id", vo.getMEMBER_ID());
			session.setAttribute("user", user);
			if (user.getMEMBER_ID().equals("admin")) {
				retVal = "redirect:getTravelSpotList.do";
			} else {
				retVal = "redirect:getTravelSpotListuser.do";
			}

		} else {
			session.setAttribute("id", vo.getMEMBER_ID());
			retVal = "redirect:login.me";
		}

		return retVal;
	}

	// 로그아웃
	@RequestMapping("logout.me")
	public String logoutProc(HttpSession session) {

		session.invalidate();

		return "redirect:login.me";

	}

	// 회원가입 GET
	@RequestMapping(value = "/memberjoin.me", method = RequestMethod.GET)
	public String getRegister() {
		return "memberjoin";
	}

	// 회원가입 POST
	@RequestMapping(value = "/memberjoin.me", method = RequestMethod.POST)
	public String postRegister(UserVO member, HttpSession session) throws Exception {
		boolean result = userService.insertMember(member); // 회원추가 후 true값 리턴받게 수정

		// DB에 추가된 후 메일 전송
		if (result) {
			UserVO vo = userService.getUser(member);

			// mail send에 필요한 값
			String tomail = vo.getMEMBER_EMAIL() + "@" + vo.getMEMBER_EMAIL_GET();
			String frommail = "shmi5821@gmail.com";
			String subject = "[TRIP] " + vo.getMEMBER_ID() + "님, 환영합니다";
			String content = "<p align=\"center\"><img style=\"size: 1200*1000;\" src=\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjvt_d81i6RHBMU7GyBxGlR-hwd30rtWH0ENvLoaMDuhHI0o7wEtlrLKRlpXPHnnXH49Mh0sNS4tc9zAkl1KeaZH2eozdtwUKTKGtJltryNcRkgL6GDiqd2_JMUtB9xu0uZQvEDT344UCq0GuW0-qGmyt3vO7MuHhFM_CIUHvyYeZ77vezz_M4NReVO/w613-h766/welcome.jpg\"></p>";

			try { // mailSender 설정
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

				mailHelper.setFrom(new InternetAddress(frommail, "TRIP", "UTF-8"));
				mailHelper.setTo(tomail);
				mailHelper.setSubject(subject);
				mailHelper.setText(content, true);

				mailSender.send(mail);

				session.invalidate();
				return "redirect:login.me";

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 회원 추가 안되면 회원가입페이지로 리턴
		return "redirect:memberjoin.me";
	}

	@GetMapping(value = "/MemberIDCheckAction.me")
	public String idchkForm(String MEMBER_ID, HttpSession session) throws Exception {
		int result = userService.idcheckMember(MEMBER_ID);

		session.setAttribute("result", result);

		return "member_idchk";
	}

	// 비밀번호 찾기 GET
	@RequestMapping(value = "/findpassword.me")
	public String findPassword() {
		return "findPW";

	}

	// 비밀번호 찾기 POST - 임시 비밀번호 메일 전송
	@RequestMapping(value = "/sendMail.me", method = RequestMethod.POST)
	public String sendMail(UserVO vo, HttpSession session) throws Exception {

		// 입력받은 id, email 일치하는 사용자정보 가져옴.
		UserVO findUser = userService.findMember(vo);

		// 일치하는 사용자 있을 때
		if (findUser != null) {

			// 6자리 랜덤 비밀번호 생성 후 random값에 저장
			char[] tmp = new char[6];
			for (int i = 0; i < tmp.length; i++) {
				int div = (int) Math.floor(Math.random() * 2);

				if (div == 0) { // 0이면 숫자
					tmp[i] = (char) (Math.random() * 10 + '0');
				} else { // 1이면 알파벳
					tmp[i] = (char) (Math.random() * 26 + 'A');
				}
			}
			String random = new String(tmp);

			// 임시 비밀번호로 user DB 업데이트
			findUser.setMEMBER_PW(random);
			userService.updateMember(findUser);

			// mail send에 필요한 값
			String tomail = findUser.getMEMBER_EMAIL() + "@" + findUser.getMEMBER_EMAIL_GET();
			String frommail = "shmi5821@gmail.com";
			String subject = "[TRIP] " + findUser.getMEMBER_ID() + "님, 임시비밀번호입니다";
			String content = System.getProperty("line.separator") + "안녕하세요 " + findUser.getMEMBER_ID() + "회원님"
					+ System.getProperty("line.separator") + "TRIP 임시비밀번호는 " + random + " 입니다."
					+ System.getProperty("line.separator") + "로그인하여 비밀번호를 변경해주세요.";

			// mailSender 설정
			try {
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

				mailHelper.setFrom(new InternetAddress(frommail, "TRIP", "UTF-8"));
				mailHelper.setTo(tomail);
				mailHelper.setSubject(subject);
				mailHelper.setText(content);

				mailSender.send(mail);

				return "redirect:login.me";

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 입력받은 정보와 일치하는 회원이 없을 때
		session.setAttribute("user", "2"); // 알림창 띄워줌
		return "redirect:findpassword.me";
	}

	// 회원정보 수정페이지
	@RequestMapping(value = "/memberupdate.me", method = RequestMethod.GET)
	public String updateFrom(UserVO vo, Model model) {
		return "updateMembers";
	}

	// 회원 메인 화면으로 이동
	@GetMapping(value = "/memberInfo.me")
	public String loginMember(UserVO vo, HttpSession session) {
		session.getAttribute("id");
		session.getAttribute("user");

		return "indexUser";
	}

	// 회원정보 수정
	@RequestMapping(value = "/memberupdate.me", method = RequestMethod.POST)
	public String updateProc(UserVO member, HttpSession session) {
		userService.updateMember(member);
		UserVO user = userService.getUser(member);
		session.setAttribute("id", member.getMEMBER_ID());
		session.setAttribute("user", user);
		return "redirect:memberdetail.me";
	}

	// 회원 탈퇴 페이지
	@RequestMapping(value = "/memberdelete.me", method = RequestMethod.GET)
	public String updateFrom(UserVO vo, HttpSession session) {
		userService.deleteMember(vo.getMEMBER_ID());
		session.invalidate();
		return "redirect:login.me";
	}

	// 회원정보 확인페이지
	@RequestMapping(value = "/memberdetail.me", method = RequestMethod.GET)
	public String detailFrom(UserVO vo, Model model) {
		return "redirect:passwordCheck.me";
	}

	// 비밀번호 확인 로직
	@RequestMapping(value = "/passwordCheck.me", method = RequestMethod.GET)
	public String passwordCheckForm(UserVO vo, HttpSession session) {

		return "passwordCheck";
	}

	@RequestMapping(value = "/passwordCheck.me", method = RequestMethod.POST)
	public String passwordCheckProc(UserVO vo, HttpSession session, HttpServletRequest request) {
		UserVO user = userService.getUser(vo);
		if (user != null && user.getMEMBER_PW().equals(vo.getMEMBER_PW())) {
			session.setAttribute("id", user.getMEMBER_ID());
			session.setAttribute("user", user);
			return "detailMembers";
		}

		return "redirect:passwordCheck.me?pw=-1";
	}

}
