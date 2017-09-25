package kr.co.goodcard.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodcard.dao.SearchKeywordDAO;
import kr.co.goodcard.service.ManagerService;
import kr.co.goodcard.util.Util;
import kr.co.goodcard.vo.SearchKeyword;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	SearchKeywordDAO searchKeywordDAO;

	@Override
	public List<String> getCreditBestBenefit() {
		SearchKeyword searchKeyword = searchKeywordDAO.getgetCreditBestBenefit();
		
		Map<String, Integer> hashMap = new HashMap<String, Integer>();
/*		hashMap.put("communication", searchKeyword.getCommunication());
		hashMap.put("restaurant", searchKeyword.getRestaurant());
		hashMap.put("mart", searchKeyword.getMart());
		hashMap.put("beauty", searchKeyword.getBeauty());
		hashMap.put("gasStation", searchKeyword.getGasStation());
		hashMap.put("fastFood", searchKeyword.getFastFood());
		hashMap.put("superMarket", searchKeyword.getSuperMarket());
		hashMap.put("bookstore", searchKeyword.getBookstore());
		hashMap.put("movie", searchKeyword.getMovie());
		hashMap.put("cafeteria", searchKeyword.getCafeteria());
		hashMap.put("onlineShopping", searchKeyword.getOnlineShopping());
		hashMap.put("academy", searchKeyword.getAcademy());
		hashMap.put("transportation", searchKeyword.getTransportation());
		hashMap.put("cafe", searchKeyword.getCafe());
		hashMap.put("convenience", searchKeyword.getConvenience());
		hashMap.put("amusementPark", searchKeyword.getAmusementPark());
		hashMap.put("medical", searchKeyword.getMedical());*/
		
		hashMap.put("통신", searchKeyword.getCommunication());
		hashMap.put("레스토랑", searchKeyword.getRestaurant());
		hashMap.put("마트", searchKeyword.getMart());
		hashMap.put("뷰티/미용", searchKeyword.getBeauty());
		hashMap.put("주유소", searchKeyword.getGasStation());
		hashMap.put("패스트푸드", searchKeyword.getFastFood());
		hashMap.put("슈퍼마켓", searchKeyword.getSuperMarket());
		hashMap.put("서점", searchKeyword.getBookstore());
		hashMap.put("영화", searchKeyword.getMovie());
		hashMap.put("식당", searchKeyword.getCafeteria());
		hashMap.put("온라인쇼핑", searchKeyword.getOnlineShopping());
		hashMap.put("학원/교육", searchKeyword.getAcademy());
		hashMap.put("대중교통", searchKeyword.getTransportation());
		hashMap.put("카페", searchKeyword.getCafe());
		hashMap.put("편의점", searchKeyword.getConvenience());
		hashMap.put("놀이공원", searchKeyword.getAmusementPark());
		hashMap.put("의료서비스", searchKeyword.getMedical());
		
		List<String> list = Util.sortByValue(hashMap);
		
		
		
		return list;
	}

}
