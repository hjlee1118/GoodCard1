package kr.co.goodcard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.goodcard.service.ManagerService;
import kr.co.goodcard.vo.Age;
import kr.co.goodcard.vo.CheckCard;
import kr.co.goodcard.vo.CreditCard;
import kr.co.goodcard.vo.Member;

@Controller
public class HomeController {
	
	private static String[] selectCategoryList = { "통신", "레스토랑", "대형마트", "뷰티/미용", "주유소", "패스트푸드", "슈퍼마켓", "서점", "영화",
			"식당", "온라인쇼핑", "학원/교육", "대중교통", "카페", "편의점", "놀이공원", "병원" };

	@Autowired
	ManagerService managerService;

	// 회원의 홈페이지
	@RequestMapping("home.do")
	public String userMain(HttpSession session) {
		return "main/userMain";
	}

	// 카드사 홈페이지
	@RequestMapping("manage.do")
	public String managerMain(Model model, HttpSession session) {
		
		List<String> creditBestBenefitList = managerService.getCreditBestBenefit();
		session.setAttribute("creditBestBenefitList", creditBestBenefitList);
		
		List<String> checkBestBenefitList = managerService.getCheckBestBenefit();
		session.setAttribute("checkBestBenefitList", checkBestBenefitList);
		
		Age age = new Age();
		age.setStartAge(20);
		age.setEndAge(29);
		
		List<String> ageBenefitList = managerService.getBestBenefitByAge(age);
		List<CreditCard> creditCardRank = managerService.getCreditCardRank();
		List<CreditCard> checkCardRank = managerService.getCheckCardRank();
		
		model.addAttribute("ageBenefitList", ageBenefitList);
		model.addAttribute("selectBenefitList", selectCategoryList);
		model.addAttribute("creditCardRank", creditCardRank);
		model.addAttribute("checkCardRank", checkCardRank);

		
		return "main/managerMain";
	}
}
