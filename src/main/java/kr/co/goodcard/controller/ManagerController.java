package kr.co.goodcard.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mysql.cj.jdbc.SuspendableXAConnection;

import kr.co.goodcard.service.ManagerService;
import kr.co.goodcard.util.Util;
import kr.co.goodcard.vo.Age;
import kr.co.goodcard.vo.CheckCard;
import kr.co.goodcard.vo.CreditCard;

@Controller
public class ManagerController {

	@Autowired
	ManagerService managerService;

	@ResponseBody
	@RequestMapping(value = "getBestBenefitByAge.do", method = RequestMethod.POST)
	public Object getBestBenefitByAge(String inputAge, HttpSession session) {

		int startAge = Integer.parseInt(inputAge);
		Age age = new Age();
		age.setStartAge(startAge);
		age.setEndAge(startAge + 9);
		List<String> ageBenefitList1 = managerService.getBestBenefitByAge(age);
		return ageBenefitList1;
	}

	@ResponseBody
	@RequestMapping(value = "getBestCardByCondition.do", method = RequestMethod.POST)
	public Object getBestCardByCondition(@RequestParam(value = "myArray[]") List<Integer> myArray, HttpSession session,
			Model model) {

		Set<String> benefitList = Util.getBenefitList(myArray);
		BasicDBObject searchQuery = new BasicDBObject();
		List<CreditCard> creditCardList = new ArrayList<CreditCard>();
		BasicDBList categoryLikeList = new BasicDBList();

		for (String s : benefitList) {
			categoryLikeList.add(new BasicDBObject("benefits.category", Pattern.compile(s)));
		}
		searchQuery.put("$and", categoryLikeList);
		creditCardList = CreditCardController.cardList(searchQuery, null, 1, 100);
		Collections.reverse(creditCardList);
		model.addAttribute("creditCardList", creditCardList);

		return creditCardList;
	}

}
