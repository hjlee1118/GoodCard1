package kr.co.goodcard.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import kr.co.goodcard.vo.SearchKeyword;

public final class Util {
		
	private static String[] COMMUNICATION_LIST = { "휴대폰" };
	private static String[] RESTAURANT_LIST = { "레스토랑", "뷔페" };
	private static String[] MART_LIST = { "마트", "코스트코" };
	private static String[] BEAUTY_LIST = { "뷰티", "화장품", "미용" };
	private static String[] GASSTATION_LIST = { "주유", "등유", "경유", "LPG", "휘발유" };
	private static String[] FASTFOOD_LIST = { "피자", "샌드위치", "패스트푸드" };
	private static String[] SUPERMARKET_LIST = { "슈퍼마켓" };
	private static String[] BOOKSTORE_LIST = { "서점" };
	private static String[] MOVIE_LIST = { "영화", "예매" };
	private static String[] CAFETERIA_LIST = { "식당" };
	private static String[] ONLINESHOPPING_LIST = { "인터넷", "쇼핑", "SPA", "복합", "소셜커머스", "아울렛", "면세점", "백화점", "의류" };
	private static String[] ACADEMY_LIST = { "교육", "학습" };
	private static String[] TRANSPORTATION_LIST = { "교통" };
	private static String[] CAFEBAKERY_LIST = { "카페", "커피", "아이스크림", "베이커리", "도너츠", "음료" };
	private static String[] CONVENIENCE_LIST = { "편의점", "업종" };
	private static String[] AMUSEMENTPARK_LIST = { "놀이", "워터파크", "공원", "아쿠아" };
	private static String[] MEDICAL_LIST = { "병원" };
	
	
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

	public static Map<String, Integer> mappingByKey(SearchKeyword searchKeyword) {

		if (searchKeyword == null) {
			searchKeyword = new SearchKeyword(0, 0, "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
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

	public static Set<String> getBenefitList(List<Integer> array) {
		
		List<String[]> myList = new ArrayList<>();
		
		//20
		myList.add(CONVENIENCE_LIST);
		myList.add(CONVENIENCE_LIST);
		myList.add(CONVENIENCE_LIST);

		//30
		myList.add(ACADEMY_LIST);
		myList.add(CONVENIENCE_LIST);
		myList.add(ACADEMY_LIST);
		
		//40
		myList.add(ACADEMY_LIST);
		myList.add(ACADEMY_LIST);
		myList.add(ACADEMY_LIST);
		
		//50
		myList.add(MEDICAL_LIST);
		myList.add(MEDICAL_LIST);
		myList.add(CONVENIENCE_LIST);
		
		Set<String> set = new HashSet<>();

		int age = array.get(0);
		int gender = array.get(1);
		
		int index = (age % 10) * 3 + gender;
		
		for(int i = 0; i< myList.get(index).length; i++){
			set.add(myList.get(index)[i]);	
		}
				
		
		int i = 1;

		while (i < array.size()) {
			if (array.get(i) == 0) {
				for (int j = 0; j < COMMUNICATION_LIST.length; j++) {
					set.add(COMMUNICATION_LIST[j]);
				}
			}
			if (array.get(i) == 1) {
				for (int j = 0; j < RESTAURANT_LIST.length; j++) {
					set.add(RESTAURANT_LIST[j]);
				}
			}
			if (array.get(i) == 2) {
				for (int j = 0; j < MART_LIST.length; j++) {
					set.add(MART_LIST[j]);
				}
			}
			if (array.get(i) == 3) {
				for (int j = 0; j < BEAUTY_LIST.length; j++) {
					set.add(BEAUTY_LIST[j]);
				}
			}
			if (array.get(i) == 4) {
				for (int j = 0; j < GASSTATION_LIST.length; j++) {
					set.add(GASSTATION_LIST[j]);
				}
			}
			if (array.get(i) == 5) {
				for (int j = 0; j < FASTFOOD_LIST.length; j++) {
					set.add(FASTFOOD_LIST[j]);
				}
			}
			if (array.get(i) == 6) {
				for (int j = 0; j < SUPERMARKET_LIST.length; j++) {
					set.add(SUPERMARKET_LIST[j]);
				}
			}
			if (array.get(i) == 7) {
				for (int j = 0; j < BOOKSTORE_LIST.length; j++) {
					set.add(BOOKSTORE_LIST[j]);
				}
			}
			if (array.get(i) == 8) {
				for (int j = 0; j < MOVIE_LIST.length; j++) {
					set.add(MOVIE_LIST[j]);
				}
			}
			if (array.get(i) == 9) {
				for (int j = 0; j < CAFETERIA_LIST.length; j++) {
					set.add(CAFETERIA_LIST[j]);
				}
			}
			if (array.get(i) == 10) {
				for (int j = 0; j < ONLINESHOPPING_LIST.length; j++) {
					set.add(ONLINESHOPPING_LIST[j]);
				}
			}
			if (array.get(i) == 11) {
				for (int j = 0; j < ACADEMY_LIST.length; j++) {
					set.add(ACADEMY_LIST[j]);
				}
			}
			if (array.get(i) == 12) {
				for (int j = 0; j < TRANSPORTATION_LIST.length; j++) {
					set.add(TRANSPORTATION_LIST[j]);
				}
			}
			if (array.get(i) == 13) {
				for (int j = 0; j < CAFEBAKERY_LIST.length; j++) {
					set.add(CAFEBAKERY_LIST[j]);
				}
			}
			if (array.get(i) == 14) {
				for (int j = 0; j < CONVENIENCE_LIST.length; j++) {
					set.add(CONVENIENCE_LIST[j]);
				}
			}
			if (array.get(i) == 15) {
				for (int j = 0; j < AMUSEMENTPARK_LIST.length; j++) {
					set.add(AMUSEMENTPARK_LIST[j]);
				}
			}

			if (array.get(i) == 16) {
				for (int j = 0; j < MEDICAL_LIST.length; j++) {
					set.add(MEDICAL_LIST[j]);
				}
			}
			i++;

		}
		return set;
	}
}