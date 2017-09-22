package kr.co.goodcard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodcard.dao.SearchKeywordDAO;
import kr.co.goodcard.service.SearchKeywordService;
import kr.co.goodcard.vo.Member;
import kr.co.goodcard.vo.SearchKeyword;

@Service
public class SearchKeywordImpl implements SearchKeywordService {

	@Autowired
	SearchKeywordDAO searchKeywordDAO;

	@Override
	public boolean insertSearchKeyword(Member member, List<String> list, String cardType) {

		SearchKeyword searchKeyword = new SearchKeyword();

		searchKeyword.setAge(member.getNo());
		searchKeyword.setCardType(cardType);

		if (list.get(0).equals("a")) {
			searchKeyword.setCommunication(1);
		} else {
			searchKeyword.setCommunication(0);
		}

		if (list.get(1).equals("a")) {
			searchKeyword.setRestaurant(1);
		} else {
			searchKeyword.setRestaurant(0);
		}

		if (list.get(2).equals("a")) {
			searchKeyword.setMart(1);
		} else {
			searchKeyword.setMart(0);
		}

		if (list.get(3).equals("a")) {
			searchKeyword.setBeauty(1);
		} else {
			searchKeyword.setBeauty(0);
		}

		if (list.get(4).equals("a")) {
			searchKeyword.setGasStation(1);
		} else {
			searchKeyword.setGasStation(0);
		}

		if (list.get(5).equals("a")) {
			searchKeyword.setFastFood(1);
		} else {
			searchKeyword.setFastFood(0);
		}

		if (list.get(6).equals("a")) {
			searchKeyword.setSuperMarket(1);
		} else {
			searchKeyword.setSuperMarket(0);
		}

		if (list.get(7).equals("a")) {
			searchKeyword.setBookstore(1);
		} else {
			searchKeyword.setBookstore(0);
		}

		if (list.get(8).equals("a")) {
			searchKeyword.setMovie(1);
		} else {
			searchKeyword.setMovie(0);
		}

		if (list.get(9).equals("a")) {
			searchKeyword.setCafeteria(1);
		} else {
			searchKeyword.setCafeteria(0);
		}

		if (list.get(10).equals("a")) {
			searchKeyword.setOnlineShopping(1);
		} else {
			searchKeyword.setOnlineShopping(0);
		}

		if (list.get(11).equals("a")) {
			searchKeyword.setAcademy(1);
		} else {
			searchKeyword.setAcademy(0);
		}

		if (list.get(12).equals("a")) {
			searchKeyword.setTransportation(1);
		} else {
			searchKeyword.setTransportation(0);
		}

		if (list.get(13).equals("a")) {
			searchKeyword.setCafe(1);
		} else {
			searchKeyword.setCafe(0);
		}

		if (list.get(14).equals("a")) {
			searchKeyword.setConvenience(1);
		} else {
			searchKeyword.setConvenience(0);
		}

		if (list.get(15).equals("a")) {
			searchKeyword.setAmusementPark(1);
		} else {
			searchKeyword.setAmusementPark(0);
		}
		
		if (list.get(16).equals("a")) {
			searchKeyword.setMedical(1);
		} else {
			searchKeyword.setMedical(0);
		}
		
		return searchKeywordDAO.insertSearchKeyword(searchKeyword);


	}
}
