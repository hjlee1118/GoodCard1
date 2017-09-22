package kr.co.goodcard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	//회원의 홈페이지
	@RequestMapping("home.do")
	public String userMain(HttpSession session){
		return "main/userMain";
	}
	
	//카드사 홈페이지
	@RequestMapping("manage.do")
	public String managerMain(HttpSession session){
		return "main/managerMain";
	}

}
