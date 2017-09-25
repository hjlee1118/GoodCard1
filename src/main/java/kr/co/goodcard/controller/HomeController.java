package kr.co.goodcard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.goodcard.service.ManagerService;
import kr.co.goodcard.vo.Member;

@Controller
public class HomeController {

	@Autowired
	ManagerService managerSerivce;

	// 회원의 홈페이지
	@RequestMapping("home.do")
	public String userMain(HttpSession session) {
		return "main/userMain";
	}

	// 카드사 홈페이지
	@RequestMapping("manage.do")
	public String managerMain(HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		String type = member.getType();
		List<String> creditBestBenefitList = managerSerivce.getCreditBestBenefit();
		session.setAttribute("creditBestBenefitList", creditBestBenefitList);
		return "main/managerMain";
	}
}
