package kr.co.goodcard.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.goodcard.vo.SearchKeyword;

public final class Util {

	public static List<String> sortByValue(final Map map) {
		List<String> list = new ArrayList();
		list.addAll(map.keySet());

		Collections.sort(list, new Comparator() {

			public int compare(Object o1, Object o2) {
				Object v1 = map.get(o1);
				Object v2 = map.get(o2);

				return ((Comparable) v2).compareTo(v1);
			}

		});
		
		return list;
	}
	
	public static Map<String, Integer> mappingByKey(SearchKeyword searchKeyword){
		
		if(searchKeyword == null){
			searchKeyword = new SearchKeyword(0,0,"",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
		}
		
		Map<String, Integer> hashMap = new HashMap<String, Integer>();
		
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
		
		return hashMap;
		
	}

}
