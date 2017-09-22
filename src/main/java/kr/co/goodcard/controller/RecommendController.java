package kr.co.goodcard.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.goodcard.service.MemberService;
import kr.co.goodcard.service.RecommendService;
import kr.co.goodcard.vo.*;

@Controller
@RequestMapping("recommend")
public class RecommendController {

	@Autowired
	RecommendService recommendService;
	
	@Autowired
	MemberService memberService;

	@RequestMapping(value = "poll.do", method = RequestMethod.GET)
	public String pollForm(HttpSession session) {
		return "recommend/pollForm";
	}

	@RequestMapping(value = "poll.do", method = RequestMethod.POST)
	public String insertPoll(Poll poll, Transportation transportation, Communication communication, GasStation gasStation, Movie movie,
			CafeBakery cafeBakery, Restaurant restaurant, FastFood fastFood, Cafeteria cafeteria,
			Convenience convenience, Mart mart, SuperMarket superMarket, OnLineShopping onLineShopping, Beauty beauty,
			AmusementPark amusementPark, Academy academy, Bookstore bookstore, Medical medical, HttpSession session) {	
		
		if(session.getAttribute("loginUser") == null){
			poll.setMemberNo(0);
		}		
		else{
			Member member = (Member)session.getAttribute("loginUser");
			poll.setMemberNo(member.getNo());
		}
		
		
		System.out.println("설문조사 제출");
		
		System.out.println(poll);
		System.out.println(transportation);
		System.out.println(communication);
		System.out.println(gasStation);
		System.out.println(movie);
		
		System.out.println(cafeBakery);
		System.out.println(restaurant);
		System.out.println(fastFood);		
		System.out.println(cafeteria);
		
		System.out.println(convenience);
		System.out.println(mart);
		System.out.println(superMarket);
		System.out.println(onLineShopping);
		
		System.out.println(beauty);		
		System.out.println(amusementPark);
		System.out.println(academy);
		System.out.println(bookstore);
		System.out.println(medical);

		recommendService.insertPoll(poll);
		
		recommendService.insertAcademy(academy);
		recommendService.insertAmusementPark(amusementPark);
		recommendService.insertBeauty(beauty);
		recommendService.insertBookstore(bookstore);
		recommendService.insertCafeBakery(cafeBakery);
		recommendService.insertCafeteria(cafeteria);
		recommendService.insertCommunication(communication);
		recommendService.insertConvenience(convenience);
		recommendService.insertFastFood(fastFood);
		recommendService.insertGasStation(gasStation);
		recommendService.insertMart(mart);
		recommendService.insertMedical(medical);
		recommendService.insertMovie(movie);
		recommendService.insertOnLineShopping(onLineShopping);
		recommendService.insertRestaurant(restaurant);
		recommendService.insertSuperMarket(superMarket);
		recommendService.insertTransportation(transportation);
		
		if(session.getAttribute("loginUser") == null){
			
		}		
		else{
		
			Member member = (Member) session.getAttribute("loginUser");
			int memberNo = member.getNo();
			int pollNo = recommendService.selectPollNoByMemberNo(memberNo);
			member.setPollNo(pollNo);
			memberService.updatePollNo(member);
			session.setAttribute("userPollNo", pollNo);
		}
		
		
		
		System.out.println(session.getAttribute("userPollNo"));

		return "redirect:/";
	}	
}
