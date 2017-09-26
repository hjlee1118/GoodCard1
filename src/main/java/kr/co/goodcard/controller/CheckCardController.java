package kr.co.goodcard.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.bson.BSONObject;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoExceptionTranslator.MongoDbErrorCodes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.introspect.TypeResolutionContext.Basic;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.WriteConcern;

import kr.co.goodcard.service.CardService;
import kr.co.goodcard.service.SearchKeywordService;
import kr.co.goodcard.util.AgeUtils;
import kr.co.goodcard.vo.CheckCard;
import kr.co.goodcard.vo.CreditCard;
import kr.co.goodcard.vo.Member;
import kr.co.goodcard.vo.mongo.AnnualFee;
import kr.co.goodcard.vo.mongo.Benefits;
import kr.co.goodcard.vo.mongo.BrandList;
import kr.co.goodcard.vo.mongo.Detail;
import kr.co.goodcard.vo.mongo.LimitBenefit;
import kr.co.goodcard.vo.mongo.ServiceList;
import kr.co.goodcard.vo.mongo.SpecialService;

@Controller
public class CheckCardController {

	@Autowired
	CardService cardService;

	@Autowired
	SearchKeywordService searchKeywordService;

	private static final String[] CHECK_CARD_LIST = { "하나카드", "국민카드", "신한카드", "삼성카드", "롯데카드", "현대카드", "우리카드", "농협카드",
			"기업카드", "씨티카드", "스탠다드차타드카드", "부산은행", "광주은행", "대구은행", "경남은행", "전북은행", "제주은행", "수협은행", "신협은행", "새마을금고",
			"산업은행", "우체국카드", "케이뱅크", "웰컴저축은행", "KB증권", "유안타증권", "동부증권", "유진투자증권", "전체" };

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

	private static String[] selectCheckCardNameList = { "하나카드 ", "국민카드 ", "신한카드 ", "삼성카드 ", "롯데카드 ", "현대카드 ", "우리카드 ",
			"NH농협카드", "IBK기업은행 ", "씨티카드 ", "SC제일은행 ", "부산은행 ", "광주은행 ", "대구은행 ", "경남은행 ", "전북은행", "제주은행 ", "수협은행 ",
			"신협 ", "새마을금고 ", "산업은행 ", "우체국체크 ", "케이뱅크 ", "웰컴저축은행", "KB증권 ", "유안타증권 ", "동부증권 ", "유진투자증권" };

	private static String[] selectCategoryList = { "통신", "레스토랑", "대형마트", "뷰티/미용", "주유소", "패스트푸드", "슈퍼마켓", "서점", "영화",
			"식당", "온라인쇼핑", "학원/교육", "대중교통", "카페", "편의점", "놀이공원", "병원" };

	/**
	 * 체크카드의 요청을 처리
	 */

	@RequestMapping("check.do")
	public String checkCardPageTest(@RequestParam("pageNo") int no, Model model, HttpSession session) {

		List<String> checkDataList = (List<String>) session.getAttribute("checkDataList");
		List<String> checkCategoryList = (List<String>) session.getAttribute("checkCategoryList");

		ArrayList<String> brand = new ArrayList<String>();
		ArrayList<String> category = new ArrayList<String>();
		
		if (checkDataList != null && checkDataList.get(28).equals("i")) {
			for (int i = 0; i <= 27; i++) {
				if (checkDataList.get(i).equals("a")) {
					brand.add(CHECK_CARD_LIST[i]);
				}
			}
		}

		if (checkCategoryList != null) {
			if (checkCategoryList.get(0).equals("a")) {
				for (int i = 0; i < COMMUNICATION_LIST.length; i++) {
					category.add(COMMUNICATION_LIST[i]);
				}
			}
			if (checkCategoryList.get(1).equals("a")) {
				for (int i = 0; i < RESTAURANT_LIST.length; i++) {
					category.add(RESTAURANT_LIST[i]);
				}
			}
			if (checkCategoryList.get(2).equals("a")) {
				for (int i = 0; i < MART_LIST.length; i++) {
					category.add(MART_LIST[i]);
				}
			}
			if (checkCategoryList.get(3).equals("a")) {
				for (int i = 0; i < BEAUTY_LIST.length; i++) {
					category.add(BEAUTY_LIST[i]);
				}
			}
			if (checkCategoryList.get(4).equals("a")) {
				for (int i = 0; i < GASSTATION_LIST.length; i++) {
					category.add(GASSTATION_LIST[i]);
				}
			}
			if (checkCategoryList.get(5).equals("a")) {
				for (int i = 0; i < FASTFOOD_LIST.length; i++) {
					category.add(FASTFOOD_LIST[i]);
				}
			}
			if (checkCategoryList.get(6).equals("a")) {
				for (int i = 0; i < SUPERMARKET_LIST.length; i++) {
					category.add(SUPERMARKET_LIST[i]);
				}
			}
			if (checkCategoryList.get(7).equals("a")) {
				for (int i = 0; i < BOOKSTORE_LIST.length; i++) {
					category.add(BOOKSTORE_LIST[i]);
				}
			}
			if (checkCategoryList.get(8).equals("a")) {
				for (int i = 0; i < MOVIE_LIST.length; i++) {
					category.add(MOVIE_LIST[i]);
				}
			}
			if (checkCategoryList.get(9).equals("a")) {
				for (int i = 0; i < CAFETERIA_LIST.length; i++) {
					category.add(CAFETERIA_LIST[i]);
				}
			}
			if (checkCategoryList.get(10).equals("a")) {
				for (int i = 0; i < ONLINESHOPPING_LIST.length; i++) {
					category.add(ONLINESHOPPING_LIST[i]);
				}
			}
			if (checkCategoryList.get(11).equals("a")) {
				for (int i = 0; i < ACADEMY_LIST.length; i++) {
					category.add(ACADEMY_LIST[i]);
				}
			}
			if (checkCategoryList.get(12).equals("a")) {
				for (int i = 0; i < TRANSPORTATION_LIST.length; i++) {
					category.add(TRANSPORTATION_LIST[i]);
				}
			}
			if (checkCategoryList.get(13).equals("a")) {
				for (int i = 0; i < CAFEBAKERY_LIST.length; i++) {
					category.add(CAFEBAKERY_LIST[i]);
				}
			}
			if (checkCategoryList.get(14).equals("a")) {
				for (int i = 0; i < CONVENIENCE_LIST.length; i++) {
					category.add(CONVENIENCE_LIST[i]);
				}
			}
			if (checkCategoryList.get(15).equals("a")) {
				for (int i = 0; i < AMUSEMENTPARK_LIST.length; i++) {
					category.add(AMUSEMENTPARK_LIST[i]);
				}
			}

			if (checkCategoryList.get(16).equals("a")) {
				for (int i = 0; i < MEDICAL_LIST.length; i++) {
					category.add(MEDICAL_LIST[i]);
				}
			}

		}

		BasicDBObject searchQuery = new BasicDBObject();
		int checkTotalCnt = 0;
		int checkTotalPageCnt = 0;

		List<CheckCard> checkCardList = new ArrayList<CheckCard>();
		BasicDBList brandLikeList = new BasicDBList();
		BasicDBList categoryLikeList = new BasicDBList();

		if (brand.size() == 0) {

			// 전체 브랜드, 카테고리 별 검색
			if (category.size() != 0) {
				for(int i = 0; i<category.size(); i++){
					categoryLikeList.add(new BasicDBObject("benefits.category", Pattern.compile(category.get(i))));
					System.out.println(category.get(i));
				}
				searchQuery.put("$or", categoryLikeList);
			}

		} else {
			
			BasicDBObject brandInQuery = new BasicDBObject("$in", brand);
			// 브랜드별로 검색
			if (category.size() == 0) {
				searchQuery.put("brand", brandInQuery);
			}
			// 브랜드별, 카테고리별 검색
			else {
				int brandSize = brand.size();
				for(int i = 0; i < brandSize; i++) {
					brandLikeList.add(new BasicDBObject("brand", brand.get(i)));
				}
				BasicDBObject brandOR = new BasicDBObject("$or", brandLikeList);
				
				int categorySize = category.size();
				for(int i = 0; i < categorySize; i++) {
					categoryLikeList.add(new BasicDBObject("benefits.category", Pattern.compile(category.get(i))));
				}
				BasicDBObject categoryOR = new BasicDBObject("$or", categoryLikeList);
				
				BasicDBList finalQuery = new BasicDBList();
				finalQuery.add(brandOR);
				finalQuery.add(categoryOR);
				searchQuery.put("$and", finalQuery);

			}
		}

		checkTotalCnt = checkCardCnt(searchQuery);

		if (checkTotalCnt % 10 == 0) {
			checkTotalPageCnt = checkTotalCnt / 10;
		} else {
			checkTotalPageCnt = checkTotalCnt / 10 + 1;
		}
		checkCardList = checkCardList(searchQuery, no);
			
		model.addAttribute("checkCardList", checkCardList);
		model.addAttribute("checkTotalCnt", checkTotalCnt);
		model.addAttribute("checkTotalPageCnt", checkTotalPageCnt);
		model.addAttribute("checkDataList", checkDataList);
		
		model.addAttribute("checkCardNameList", selectCheckCardNameList);
		model.addAttribute("selectCheckCategoryList", selectCategoryList);

		return "check/list";

	}

	public static int checkCardCnt(BasicDBObject searchQuery) {
		MongoClient mongo = new MongoClient("13.125.7.180", 27017);
		DB db = mongo.getDB("hana");

		DBCollection collection = db.getCollection("checkCard");

		int count = 0;

		if (searchQuery != null && searchQuery.size() > 0) {
			count = collection.find(searchQuery).count();
		} else {
			count = collection.find().count();
		}
		return count;
	}

	public static List<CheckCard> checkCardList(BasicDBObject searchQuery, int pageNo) {
		try {
			MongoClient mongo = new MongoClient("13.125.7.180", 27017);
			DB db = mongo.getDB("hana");

			// get a single collection
			DBCollection collection = db.getCollection("checkCard");
			int skipPage = (pageNo - 1) * 10;

			DBCursor cursor;

			if (searchQuery != null && searchQuery.size() != 0) {
				cursor = collection.find(searchQuery).skip(skipPage).limit(10);
			} else {
				cursor = collection.find().skip(skipPage).limit(10);
			}

			List<CheckCard> list = new ArrayList<>();

			while (cursor.hasNext()) {

				BasicDBObject cardDBObject = (BasicDBObject) cursor.next();
				CheckCard checkCard = new CheckCard();

				checkCard.setId(cardDBObject.getString("_id"));
				checkCard.setBrand(cardDBObject.getString("brand"));
				checkCard.setCardType(cardDBObject.getString("cardType"));
				checkCard.setCardName(cardDBObject.getString("cardName"));
				checkCard.setAnnotation(cardDBObject.getString("annotation"));
				File imagePath = new File(cardDBObject.getString("imagePath"));
				checkCard.setImagePath(imagePath.getName());
				checkCard.setViewCount(cardDBObject.getInt("viewCount"));

				// annualFee
				try {
					List<AnnualFee> annualFees = new ArrayList<AnnualFee>();
					BasicDBList annualFeeList = (BasicDBList) cardDBObject.get("annualFee");

					for (int i = 0; i < annualFeeList.size(); i++) {
						BasicDBObject annualFeeObj = (BasicDBObject) annualFeeList.get(i);
						String brand = annualFeeObj.getString("brand");
						int fee = annualFeeObj.getInt("fee");

						AnnualFee annualFee = new AnnualFee();
						annualFee.setBrand(brand);
						annualFee.setFee(fee);

						annualFees.add(annualFee);
					}

					checkCard.setAnnualFee(annualFees);
				} catch (Exception e) {

				}

				// limitBenefit
				try {
					List<LimitBenefit> limitBenefits = new ArrayList<LimitBenefit>();
					BasicDBList limitBenefitList = (BasicDBList) cardDBObject.get("limitBenefit");

					for (int i = 0; i < limitBenefitList.size(); i++) {

						BasicDBObject limitBenefitObj = (BasicDBObject) limitBenefitList.get(i);
						int prevPerformance = limitBenefitObj.getInt("prevPerformance");
						int maxBenefit = limitBenefitObj.getInt("maxBenefit");

						LimitBenefit limitBenefit = new LimitBenefit();
						limitBenefit.setPrevPerformance(prevPerformance);
						limitBenefit.setMaxBenefit(maxBenefit);

						limitBenefits.add(limitBenefit);

					}

					checkCard.setLimitBenefit(limitBenefits);

				} catch (Exception e) {

				}

				try {

					// SpecialService
					List<SpecialService> specialServices = new ArrayList<SpecialService>();
					BasicDBList specialServiceList = (BasicDBList) cardDBObject.get("specialService");

					for (int i = 0; i < specialServiceList.size(); i++) {

						BasicDBObject specialServiceObj = (BasicDBObject) specialServiceList.get(i);
						String category = specialServiceObj.getString("category");

						List<Detail> details = new ArrayList<Detail>();
						BasicDBList detailList = (BasicDBList) specialServiceObj.get("detail");

						SpecialService specialService = new SpecialService();
						specialService.setCategory(category);
						try {
							for (int j = 0; j < detailList.size(); j++) {
								BasicDBObject detailObj = (BasicDBObject) detailList.get(j);
								String detailCategory = detailObj.getString("detailCategory");

								Detail detail = new Detail();
								detail.setDetailCategory(detailCategory);

								try {
									List<ServiceList> serviceLists = new ArrayList<ServiceList>();
									BasicDBList serviceListList = (BasicDBList) detailObj.get("serviceList");

									for (int k = 0; k < serviceListList.size(); k++) {
										BasicDBObject serviceListObj = (BasicDBObject) serviceListList.get(k);
										String service = serviceListObj.getString("service");
										String content = serviceListObj.getString("content");

										ServiceList serviceList = new ServiceList();
										serviceList.setService(service);
										serviceList.setContent(content);

										serviceLists.add(serviceList);
									}
									detail.setServiceList(serviceLists);
								} catch (Exception e) {
								}

								details.add(detail);

							}

							specialService.setDetail(details);

						} catch (Exception e) {

						}

						specialServices.add(specialService);

					}

					checkCard.setSpecialServices(specialServices);

				} catch (Exception e) {
				}

				// Benefit
				try {
					List<Benefits> benefitss = new ArrayList<Benefits>();
					BasicDBList benefitsList = (BasicDBList) cardDBObject.get("benefits");

					for (int i = 0; i < benefitsList.size(); i++) {

						BasicDBObject benefitsObj = (BasicDBObject) benefitsList.get(i);
						String benefitsCategory = benefitsObj.getString("category");

						try {
							List<BrandList> brandLists = new ArrayList<BrandList>();
							BasicDBList brandListList = (BasicDBList) benefitsObj.get("brandList");

							Benefits benefits = new Benefits();
							benefits.setCategory(benefitsCategory);

							for (int j = 0; j < brandListList.size(); j++) {
								BasicDBObject brandListObj = (BasicDBObject) brandListList.get(j);
								String brand = brandListObj.getString("brand");
								String benefitBenefit = brandListObj.getString("benefit");
								int benefitPrevperformance = brandListObj.getInt("prevPerformance");
								String constraint = brandListObj.getString("constraint").replaceAll("\n", "");
								constraint = constraint.replaceAll("\r", "");

								BrandList brandList = new BrandList();
								brandList.setBrand(brand);
								brandList.setBenefit(benefitBenefit);
								brandList.setPrevPerformance(benefitPrevperformance);
								brandList.setConstraint(constraint);

								brandLists.add(brandList);
							}

							benefits.setBrandList(brandLists);

							benefitss.add(benefits);

						} catch (Exception e) {
						}

					}

					checkCard.setBenefits(benefitss);
				} catch (Exception e) {
				}

				checkCard.setHomepageURL("https://www.hanacard.co.kr/");

				list.add(checkCard);
			}

			System.out.println(list.get(0));
			mongo.close();

			return list;

		} catch (Exception e) {

		}
		return null;

	}

	
	@ResponseBody
	@RequestMapping(value = "searchQueryBrand.do")
	public boolean searchQueryBrand(@RequestBody List<String> list, HttpSession session, Model model) {

		// System.out.println("searchQueryBrand 실행");

		if (list != null && list.size() > 0) {

			Member member = (Member)session.getAttribute("loginUser");
			List<String> checkDataList = new ArrayList<String>();
			List<String> checkCategoryList = new ArrayList<String>();
			List<String> searchKeywordList = new ArrayList<String>();

			int checkCnt = 0;
			int categoryCnt = 0;

			for (int i = 0; i <= 28; i++) {
				if (list.get(i).equals("a")) {
					checkCnt++;
				}
				checkDataList.add(list.get(i));
			}

			for (int i = 29; i <= 45; i++) {
				if (list.get(i).equals("a")) {
					categoryCnt++;
				}
				searchKeywordList.add(list.get(i));
				checkCategoryList.add(list.get(i));
			}
			
			if(member != null){
				Date date = new Date(member.getBirthDate().getTime());
				
				int birthYear = date.getYear()+1900;
				int birthMonth = date.getMonth()+1;
				int birthDay = date.getDate();

				int age = AgeUtils.getAge(birthYear, birthMonth, birthDay);
				
				boolean b = searchKeywordService.insertSearchKeyword(list, age, "check");
				System.out.println("check search keyword : " + b);
			}
			
			if (checkCnt > 0) {
				session.setAttribute("checkDataList", checkDataList);
			} else {
				session.setAttribute("checkDataList", null);
			}

			if (categoryCnt > 0) {
				session.setAttribute("checkCategoryList", checkCategoryList);
			} else {
				session.setAttribute("checkCategoryList", null);
			}
			return true;
		} else {
			return false;
		}
	}
	
	@ResponseBody
	@RequestMapping("check/updateViewCnt.do")
	public boolean updateViewCnt(String id){
		
		System.out.println(id);
		
		MongoClient mongo = new MongoClient("13.125.7.180", 27017);
		DB db = mongo.getDB("hana");

		// get a single collection
		DBCollection collection = db.getCollection("checkCard");
		
		BasicDBObject query = new BasicDBObject();
		query.put("_id", new ObjectId(id));
		
		BasicDBObject incValue = new BasicDBObject("viewCount", 1);
		BasicDBObject intModifier = new BasicDBObject("$inc", incValue);
		
		collection.update(query, intModifier, false, false, WriteConcern.SAFE);
		
		System.out.println(collection.findOne(query).get("viewCount"));
		
		
		return true;
	}
	

}
