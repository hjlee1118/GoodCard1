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
import kr.co.goodcard.util.Util;
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
		return "member/joinForm";
	}

	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public String join(Member member) {
		member.setPhone(member.getPhone1() + '-' + member.getPhone2() + '-' + member.getPhone3());
		member.setBirthDate(Util.TransformDate(member.getInputBirthDate()));
		System.out.println(member);
		boolean isSuccess = memberService.insertMember(member);
		if (isSuccess == false) {
			return "member/joinForm";
		}
		return "redirect:/";
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
