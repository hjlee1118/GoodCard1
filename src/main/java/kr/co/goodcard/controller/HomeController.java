package kr.co.goodcard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.goodcard.service.ManagerService;
import kr.co.goodcard.vo.Age;
import kr.co.goodcard.vo.Member;

@Controller
public class HomeController {

	@Autowired
	ManagerService managerService;

	// 회원의 홈페이지
	@RequestMapping("home.do")
	public String userMain(HttpSession session) {
		return "main/userMain";
	}

	// 카드사 홈페이지
	@RequestMapping("manage.do")
	public String managerMain(HttpSession session) {
		
		List<String> creditBestBenefitList = managerService.getCreditBestBenefit();
		session.setAttribute("creditBestBenefitList", creditBestBenefitList);
		
		List<String> checkBestBenefitList = managerService.getCheckBestBenefit();
		session.setAttribute("checkBestBenefitList", checkBestBenefitList);
		
		Age age = new Age();
		age.setStartAge(20);
		age.setEndAge(29);
		
		List<String> ageBenefitList = managerService.getBestBenefitByAge(age);
		
		session.setAttribute("ageBenefitList", ageBenefitList);
		
		
		return "main/managerMain";
	}
}
