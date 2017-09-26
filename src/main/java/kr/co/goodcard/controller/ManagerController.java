package kr.co.goodcard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodcard.service.ManagerService;
import kr.co.goodcard.vo.Age;

@Controller
public class ManagerController {
	
	@Autowired
	ManagerService managerService;
	
	@ResponseBody
	@RequestMapping(value="getBestBenefitByAge.do", method=RequestMethod.POST)
	public Object getBestBenefitByAge(String inputAge, HttpSession session){
		
		int startAge = Integer.parseInt(inputAge);
		
		Age age = new Age();
		age.setStartAge(startAge);
		age.setEndAge(startAge+9);
		
		List<String> ageBenefitList1 = managerService.getBestBenefitByAge(age);
		
		System.out.println(ageBenefitList1.get(0));

		return ageBenefitList1;
	}

}
