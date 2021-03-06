package kr.co.goodcard.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodcard.service.CardService;
import kr.co.goodcard.vo.CreditCard;
import kr.co.goodcard.vo.Member;

@Controller
public class CardController {

	@Autowired
	CardService cardService;

	@ResponseBody
	@RequestMapping(value = "insertMyCard.do", method = RequestMethod.POST)
	public boolean insertMyCard(String id, HttpSession session) {

		Member member = (Member) session.getAttribute("loginUser");

		if (member.getCard1() == null || member.getCard1().equals("")) {
			cardService.insertMyCard(id, member);
			member.setCard1(id);
			session.setAttribute("loginUser", member);
			return true;
		} else {
			if (member.getCard2() == null || member.getCard2().equals("")) {
				cardService.insertMyCard(id, member);
				member.setCard2(id);
				session.setAttribute("loginUser", member);
				return true;
			} else {
				if (member.getCard3() == null || member.getCard3().equals("")) {
					cardService.insertMyCard(id, member);
					member.setCard3(id);
					session.setAttribute("loginUser", member);
					return true;
				} else {
					return false;
				}
			}
		}
	}

	@ResponseBody
	@RequestMapping(value = "deleteMyCard.do", method = RequestMethod.POST)
	public boolean deleteMyCard(String id, HttpSession session) {

		Member member = (Member) session.getAttribute("loginUser");

		System.out.println("member card1 : " + member.getCard1());
		System.out.println("member card2 : " + member.getCard2());
		System.out.println("member card3: " + member.getCard3());

		System.out.println("delete id : " + id);

		if (member.getCard1() != null && member.getCard1().equals(id)) {
			cardService.deleteMyCard(id, member);
			member.setCard1("");
			session.setAttribute("loginUser", member);
		}

		if (member.getCard2() != null && member.getCard2().equals(id)) {
			cardService.deleteMyCard(id, member);
			member.setCard2("");
			session.setAttribute("loginUser", member);
		}

		if (member.getCard3() != null && member.getCard3().equals(id)) {
			cardService.deleteMyCard(id, member);
			member.setCard3("");
			session.setAttribute("loginUser", member);
		}

		List<String> nameList = new ArrayList<>();

		if (member.getCard1() != null || member.getCard1().length() != 0) {
			nameList.add(member.getCard1());
		}
		if (member.getCard2() != null || member.getCard2().length() != 0) {
			nameList.add(member.getCard2());
		}
		if (member.getCard3() != null || member.getCard3().length() != 0) {
			nameList.add(member.getCard3());
		}

		List<CreditCard> myCardList = new ArrayList<>();

		for (String cardId : nameList) {
			CreditCard myCard = new CreditCard();
			try {
				myCard = CreditCardController.searchCreditCardById(cardId);
				if (myCard.getCardName() == null || myCard.getCardName().length() == 0) {

				} else {
					myCardList.add(myCard);
				}
			} catch (Exception e) {
			}
			try {
				myCard = CheckCardController.searchCheckCardById(cardId);
				if (myCard.getCardName() == null || myCard.getCardName().length() == 0) {

				} else {
					myCardList.add(myCard);
				}
			} catch (Exception e) {
			}
		}
		session.setAttribute("myCardList", myCardList);

		return true;
	}

}
