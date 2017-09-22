package kr.co.goodcard.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodcard.service.MemberService;
import kr.co.goodcard.vo.Member;

@Controller
@RequestMapping("member")
public class MemberController {
	
	
	@Autowired
	MemberService memberService;
	
	/**
	 * 회원 가입하는 폼을 내려준다.
	 */

	@RequestMapping(value = "join.do", method = RequestMethod.GET)
	public String joinForm() {
		System.out.println("join 실행");
		return "member/joinForm";
	}

	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public String join(Member member) {
		member.setPhone(member.getPhone1() + '-' + member.getPhone2() + '-' + member.getPhone3());
		member.setBirthDate(TransformDate(member.getInputBirthDate()));
		System.out.println(member);
		boolean isSuccess = memberService.insertMember(member);
		if (isSuccess == false) {
			return "member/joinForm";
		}
		return "redirect:/";
	}

	private Date TransformDate(String date) {
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");

		// Date로 변경하기 위해서는 날짜 형식을 yyyy-mm-dd로 변경해야 한다.
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");

		java.util.Date tempDate = null;

		try {
			// 현재 yyyymmdd로된 날짜 형식으로 java.util.Date객체를 만든다.
			tempDate = beforeFormat.parse(date);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// java.util.Date를 yyyy-mm-dd 형식으로 변경하여 String로 반환한다.
		String transDate = afterFormat.format(tempDate);

		// 반환된 String 값을 Date로 변경한다.
		Date d = Date.valueOf(transDate);

		return d;
	}

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String loginForm() {
		System.out.println("loginForm 실행");
		return "member/loginForm";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(Member member, HttpSession session) {
		System.out.println(member);
		Member loginUser = memberService.login(member);
		if (loginUser == null) {
			return "member/loginForm";
		}
		session.setAttribute("loginUser", loginUser);
		return "redirect:/";
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping("checkId.do")
	public int checkId(String currentId) {
		System.out.println(currentId);
		int count = memberService.checkId(currentId);
		return count;
	}
	
	@RequestMapping("mypage.do")
	public String mypage(HttpSession session){
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(loginUser);
		return "member/mypage";
	}

}
