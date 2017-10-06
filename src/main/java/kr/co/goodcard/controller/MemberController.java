package kr.co.goodcard.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodcard.service.MemberService;
import kr.co.goodcard.util.Util;
import kr.co.goodcard.vo.CreditCard;
import kr.co.goodcard.vo.Member;

@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	MemberService memberService;

	@RequestMapping(value = "join.do", method = RequestMethod.GET)
	public String joinForm() {
		return "member/joinForm";
	}

	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public String join(Member member) {
		member.setPhone(member.getPhone1() + '-' + member.getPhone2() + '-' + member.getPhone3());
		member.setBirthDate(Util.TransformDate(member.getInputBirthDate()));

		System.out.print("회원가입");
		System.out.println(member);
		boolean isSuccess = memberService.insertMember(member);
		if (isSuccess == false) {
			return "member/joinForm";
		}
		return "redirect:/";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(Member member, HttpSession session) {
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
	@RequestMapping(value = "checkId.do", method = RequestMethod.POST)
	public int checkId(String id) {
		int count = memberService.checkId(id);
		return count;
	}

	@RequestMapping(value = "mypage.do", method = RequestMethod.GET)
	public String mypage(HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser != null) {
			String phone[] = loginUser.getPhone().split("-");
			loginUser.setPhone1(phone[0]);
			loginUser.setPhone2(phone[1]);
			loginUser.setPhone3(phone[2]);

			String str = "";
			String birthDate[] = loginUser.getBirthDate().toString().split("-");
			for (String s : birthDate) {
				str += s;
			}
			loginUser.setInputBirthDate(str);

			List<String> nameList = new ArrayList<>();

			if (loginUser.getCard1() == null || loginUser.getCard1().length() != 0) {
				nameList.add(loginUser.getCard1());
			}
			if (loginUser.getCard2() == null || loginUser.getCard2().length() != 0) {
				nameList.add(loginUser.getCard2());
			}
			if (loginUser.getCard3() == null || loginUser.getCard3().length() != 0) {
				nameList.add(loginUser.getCard3());
			}

			List<CreditCard> myCardList = new ArrayList<>();

			for (String id : nameList) {
				CreditCard myCard = new CreditCard();
				try {
					myCard = CreditCardController.searchCreditCardById(id);
					if (myCard.getCardName() == null || myCard.getCardName().length() == 0) {

					} else {
						myCardList.add(myCard);
					}
				} catch (Exception e) {
				}
				try {
					myCard = CheckCardController.searchCheckCardById(id);
					if (myCard.getCardName() == null || myCard.getCardName().length() == 0) {

					} else {
						myCardList.add(myCard);
					}
				} catch (Exception e) {
				}
			}
			session.setAttribute("myCardList", myCardList);
			session.setAttribute("loginUser", loginUser);
			return "member/mypage";
		}
		return "redirect:/";
	}

	@RequestMapping(value = "mypage.do", method = RequestMethod.POST)
	public String updateMember(Member member, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		member.setId(loginUser.getId());
		member.setPhone(member.getPhone1() + '-' + member.getPhone2() + '-' + member.getPhone3());
		member.setBirthDate(Util.TransformDate(member.getInputBirthDate()));
		System.out.println("계산된 birthDate" + member.getBirthDate());
		boolean b = memberService.updateMember(member);
		if (b == true) {
			session.setAttribute("loginUser", member);
			System.out.println(member);
			return "member/mypage";
		} else {
			return "redirect:/";
		}
	}

}
