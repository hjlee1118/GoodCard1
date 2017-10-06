package kr.co.goodcard.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import kr.co.goodcard.service.MemberService;
import kr.co.goodcard.service.RecommendCountService;
import kr.co.goodcard.service.RecommendService;
import kr.co.goodcard.vo.Academy;
import kr.co.goodcard.vo.AmusementPark;
import kr.co.goodcard.vo.Beauty;
import kr.co.goodcard.vo.Benefit;
import kr.co.goodcard.vo.Bookstore;
import kr.co.goodcard.vo.CafeBakery;
import kr.co.goodcard.vo.Cafeteria;
import kr.co.goodcard.vo.Communication;
import kr.co.goodcard.vo.Convenience;
import kr.co.goodcard.vo.CreditCard;
import kr.co.goodcard.vo.Estimate;
import kr.co.goodcard.vo.FastFood;
import kr.co.goodcard.vo.GasStation;
import kr.co.goodcard.vo.Mart;
import kr.co.goodcard.vo.Medical;
import kr.co.goodcard.vo.Member;
import kr.co.goodcard.vo.Movie;
import kr.co.goodcard.vo.NonBenefit;
import kr.co.goodcard.vo.OnLineShopping;
import kr.co.goodcard.vo.Poll;
import kr.co.goodcard.vo.RecommendCount;
import kr.co.goodcard.vo.Restaurant;
import kr.co.goodcard.vo.SuperMarket;
import kr.co.goodcard.vo.Transportation;
import kr.co.goodcard.vo.mongo.AnnualFee;
import kr.co.goodcard.vo.mongo.Benefits;
import kr.co.goodcard.vo.mongo.BrandList;
import kr.co.goodcard.vo.mongo.Detail;
import kr.co.goodcard.vo.mongo.LimitBenefit;
import kr.co.goodcard.vo.mongo.ServiceList;
import kr.co.goodcard.vo.mongo.SpecialService;

@Controller
@RequestMapping("recommend")
public class RecommendController {
   @Autowired
   RecommendService recommendService;

   @Autowired
   MemberService memberService;
   
   @Autowired
   RecommendCountService recommendCountService;

   private static final HashMap<String, ArrayList<String>> CATEGORY_CONVERTER = new HashMap<>();
   private static final int PRICE_PER_LITER = 1500;
   private static final int CATEGORY_LENGTH = 17;
   private static final String mongoCategory = "benefits.category";
   // private static final String mongoBrand = "benefits.brandList.brand";
   private static final String prevPerformance = "benefits.brandList.prevPerformance";
   private static final String prevPerformanceDemand = "limitBenefit.prevPerformance";
   private static final String HOST = "13.125.9.203";
   private static final ArrayList<String> CATEGORY_LIST = new ArrayList<>();
   private static MongoClient mongoClient = new MongoClient(HOST, 27017);
   private static MongoDatabase db = mongoClient.getDatabase("hana");
   private static MongoCollection<Document> creditCardCollection = db.getCollection("creditCard");
   private static MongoCollection<Document> checkCardCollection = db.getCollection("checkCard");
   // private static MongoCollection<Document> hybridCardCollection =
   // db.getCollection("hybridCard");

   static {
      ArrayList<String> communication = new ArrayList<>();
      communication.add("휴대폰요금");
      ArrayList<String> restaurant = new ArrayList<>();
      restaurant.add("패밀리레스토랑");
      restaurant.add("뷔페");
      ArrayList<String> mart = new ArrayList<>();
      mart.add("대형마트");
      mart.add("코스트코");
      ArrayList<String> beauty = new ArrayList<>();
      beauty.add("뷰티스토어");
      beauty.add("뷰티로드숍");
      beauty.add("화장품");
      beauty.add("온라인화장품");
      beauty.add("미용실");
      ArrayList<String> gasstation = new ArrayList<>();
      gasstation.add("등유");
      gasstation.add("휘발유");
      gasstation.add("경유");
      gasstation.add("LPG");
      ArrayList<String> fastfood = new ArrayList<>();
      fastfood.add("피자");
      fastfood.add("샌드위치");
      fastfood.add("패스트푸드");
      ArrayList<String> supermarket = new ArrayList<>();
      supermarket.add("슈퍼마켓");
      ArrayList<String> bookstore = new ArrayList<>();
      bookstore.add("서점");
      ArrayList<String> movie = new ArrayList<>();
      movie.add("영화");
      movie.add("온라인영화예매");
      ArrayList<String> cafeteria = new ArrayList<>();
      cafeteria.add("기타음식점");
      ArrayList<String> onlineshopping = new ArrayList<>();
      onlineshopping.add("온라인쇼핑몰");
      onlineshopping.add("홈쇼핑");
      onlineshopping.add("SPA브랜드");
      onlineshopping.add("복합쇼핑몰");
      onlineshopping.add("소셜커머스");
      onlineshopping.add("아울렛");
      onlineshopping.add("면세점");
      onlineshopping.add("백화점");
      onlineshopping.add("브랜드의류");
      ArrayList<String> academy = new ArrayList<>();
      academy.add("교육서비스");
      academy.add("유아교육");
      academy.add("학습지");
      ArrayList<String> transportation = new ArrayList<>();
      transportation.add("교통");
      ArrayList<String> cafebakery = new ArrayList<>();
      cafebakery.add("카페");
      cafebakery.add("아이스크림");
      cafebakery.add("베이커리");
      cafebakery.add("도너츠");
      cafebakery.add("음료");
      ArrayList<String> convenience = new ArrayList<>();
      convenience.add("편의점");
      ArrayList<String> amusementpark = new ArrayList<>();
      amusementpark.add("놀이공원");
      amusementpark.add("워터파크");
      amusementpark.add("아쿠아리움");
      ArrayList<String> medical = new ArrayList<>();
      medical.add("일반병원");
      medical.add("종합병원");
      CATEGORY_CONVERTER.put("COMMUNICATION", communication);
      CATEGORY_CONVERTER.put("RESTAURANT", restaurant);
      CATEGORY_CONVERTER.put("MART", mart);
      CATEGORY_CONVERTER.put("BEAUTY", beauty);
      CATEGORY_CONVERTER.put("GASSTATION", gasstation);
      CATEGORY_CONVERTER.put("FASTFOOD", fastfood);
      CATEGORY_CONVERTER.put("SUPERMARKET", supermarket);
      CATEGORY_CONVERTER.put("BOOKSTORE", bookstore);
      CATEGORY_CONVERTER.put("MOVIE", movie);
      CATEGORY_CONVERTER.put("CAFETERIA", cafeteria);
      CATEGORY_CONVERTER.put("ONLINESHOPPING", onlineshopping);
      CATEGORY_CONVERTER.put("ACADEMY", academy);
      CATEGORY_CONVERTER.put("TRANSPORTATION", transportation);
      CATEGORY_CONVERTER.put("CAFEBAKERY", cafebakery);
      CATEGORY_CONVERTER.put("CONVENIENCE", convenience);
      CATEGORY_CONVERTER.put("AMUSEMENTPARK", amusementpark);
      CATEGORY_CONVERTER.put("MEDICAL", medical);
      CATEGORY_LIST.add("COMMUNICATION");
      CATEGORY_LIST.add("RESTAURANT");
      CATEGORY_LIST.add("MART");
      CATEGORY_LIST.add("BEAUTY");
      CATEGORY_LIST.add("GASSTATION");
      CATEGORY_LIST.add("FASTFOOD");
      CATEGORY_LIST.add("SUPERMARKET");
      CATEGORY_LIST.add("BOOKSTORE");
      CATEGORY_LIST.add("MOVIE");
      CATEGORY_LIST.add("CAFETERIA");
      CATEGORY_LIST.add("ONLINESHOPPING");
      CATEGORY_LIST.add("ACADEMY");
      CATEGORY_LIST.add("TRANSPORTATION");
      CATEGORY_LIST.add("CAFEBAKERY");
      CATEGORY_LIST.add("CONVENIENCE");
      CATEGORY_LIST.add("AMUSEMENTPARK");
      CATEGORY_LIST.add("MEDICAL");
   }

   private static int convertMoneyUnit(int money) {
      return money * 10000;
   }

   private BasicDBObject makeQuery(HashSet<String> searchCategoryList, int monthlySpend) {
      BasicDBList mongoCategoryORSearchList = new BasicDBList();
      BasicDBObject mongoPrevPerformanceConstraint = new BasicDBObject("$lte", monthlySpend);
      for (String iter : searchCategoryList) {
         mongoCategoryORSearchList.add(
               new BasicDBObject(mongoCategory, iter).append(prevPerformance, mongoPrevPerformanceConstraint));
      }
      BasicDBObject mongoCategoryORSeqrchQuery = new BasicDBObject("$or", mongoCategoryORSearchList);

      BasicDBList mongoPrevPerformanceORSearchList = new BasicDBList();
      mongoPrevPerformanceORSearchList
            .add(new BasicDBObject(prevPerformanceDemand, new BasicDBObject("$lte", monthlySpend)));
      mongoPrevPerformanceORSearchList
            .add(new BasicDBObject(prevPerformanceDemand, new BasicDBObject("$exists", false)));
      BasicDBObject mongoPrevPerformanceORSearchQuery = new BasicDBObject("$or", mongoPrevPerformanceORSearchList);

      BasicDBList mongoANDQueryList = new BasicDBList();
      mongoANDQueryList.add(mongoPrevPerformanceORSearchQuery);
      mongoANDQueryList.add(mongoCategoryORSeqrchQuery);
      return new BasicDBObject("$and", mongoANDQueryList);
   }

   private ArrayList<CreditCard> getCardList(FindIterable<Document> fi) {
      MongoCursor<Document> cursor = fi.iterator();
      ArrayList<CreditCard> cardList = new ArrayList<>();
      while (cursor.hasNext()) {
         Document iter = (Document) cursor.next();
         CreditCard tempCard = new CreditCard();
         tempCard.setNo((int) iter.get("no"));
         tempCard.setCardName((String) iter.get("cardName"));
         tempCard.setCardType((String) iter.get("cardType"));
         tempCard.setBrand((String) iter.get("brand"));
         tempCard.setAnnotation((String) iter.get("annotation"));
         tempCard.setImagePath((String) iter.get("imagePath"));
         tempCard.setViewCount((int) iter.get("viewCount"));
         List<Document> annualFeeDocList = (List<Document>) iter.getOrDefault("annualFee", null);
         List<Document> limitBenefitDocList = (List<Document>) iter.getOrDefault("limitBenefit", null);
         List<Document> specialServiceDocList = (List<Document>) iter.getOrDefault("specialService", null);
         List<Document> benefitsDocList = (List<Document>) iter.getOrDefault("benefits", null);
         tempCard.setAnnualFee(getAnnualFee(annualFeeDocList));
         tempCard.setLimitBenefit(getLimitBenefit(limitBenefitDocList));
         tempCard.setSpecialServices(getSpecialService(specialServiceDocList));
         tempCard.setBenefits(getBenefits(benefitsDocList));
         cardList.add(tempCard);
      }

      return cardList;
   }

   private List<AnnualFee> getAnnualFee(List<Document> annualFeeDocList) {
      if (annualFeeDocList == null)
         return null;

      ArrayList<AnnualFee> annualFee = new ArrayList<>();
      for (Document iter : annualFeeDocList) {
         AnnualFee temp = new AnnualFee();
         temp.setBrand(iter.getString("brand"));
         temp.setFee(iter.getInteger("fee", 0));
         annualFee.add(temp);
      }
      return annualFee;
   }

   private List<LimitBenefit> getLimitBenefit(List<Document> limitBenefitDocList) {
      if (limitBenefitDocList == null)
         return null;

      ArrayList<LimitBenefit> limitBenefit = new ArrayList<>();
      for (Document iter : limitBenefitDocList) {
         LimitBenefit temp = new LimitBenefit();
         temp.setPrevPerformance(iter.getInteger("prevPerformance", 0));
         temp.setMaxBenefit(iter.getInteger("maxBenefit", 0));
         limitBenefit.add(temp);
      }
      return limitBenefit;
   }

   private List<SpecialService> getSpecialService(List<Document> specialServiceDocList) {
      if (specialServiceDocList == null)
         return null;

      ArrayList<SpecialService> specialService = new ArrayList<>();
      for (Document iter : specialServiceDocList) {
         SpecialService temp = new SpecialService();
         temp.setCategory(iter.getString("category"));
         Document detailDoc = (Document) iter.getOrDefault("detail", null);
         ArrayList<Detail> temp2 = new ArrayList<>();
         temp2.add(getDetail(detailDoc));
         temp.setDetail(temp2);
         specialService.add(temp);
      }
      return specialService;
   }

   private Detail getDetail(Document detailDoc) {
      if (detailDoc == null)
         return null;

      Detail detail = new Detail();
      detail.setDetailCategory(detailDoc.getString("detailCategory"));
      List<Document> serviceListDocList = (List<Document>) detailDoc.getOrDefault("serviceList", null);
      detail.setServiceList(getServiceList(serviceListDocList));
      return detail;
   }

   private List<ServiceList> getServiceList(List<Document> serviceListDocList) {
      if (serviceListDocList == null)
         return null;

      ArrayList<ServiceList> serviceList = new ArrayList<>();
      for (Document iter : serviceListDocList) {
         ServiceList temp = new ServiceList();
         temp.setService(iter.getString("service"));
         temp.setContent(iter.getString("content"));
         serviceList.add(temp);
      }
      return serviceList;
   }

   private List<Benefits> getBenefits(List<Document> benefitsDocList) {
      if (benefitsDocList == null)
         return null;

      ArrayList<Benefits> benefits = new ArrayList<>();
      for (Document iter : benefitsDocList) {
         Benefits temp = new Benefits();
         temp.setCategory(iter.getString("category"));
         List<Document> brandListDocList = (List<Document>) iter.getOrDefault("brandList", null);
         temp.setBrandList(getBrandList(brandListDocList));
         benefits.add(temp);
      }
      return benefits;
   }

   private List<BrandList> getBrandList(List<Document> brandListDocList) {
      if (brandListDocList == null)
         return null;

      ArrayList<BrandList> brandList = new ArrayList<>();
      for (Document iter : brandListDocList) {
         BrandList temp = new BrandList();
         temp.setBrand(iter.getString("brand"));
         temp.setBenefit(iter.getString("benefit"));
         temp.setConstraint(iter.getString("constraint"));
         temp.setBenefitType(iter.getInteger("benefitType", 5));
         temp.setBenefitPerLiter((double) iter.getOrDefault("benefitPerLiter", 0.0));
         temp.setBenefitAmount((double) iter.getOrDefault("benefitAmount", 0.0));
         temp.setBenefitPercent((double) iter.getOrDefault("benefitPercent", 0.0));
         temp.setBenefitMileagePerSpend((double) iter.getOrDefault("benefitMileagePerSpend", 0.0));
         temp.setPrevPerformance(iter.getInteger("prevPerformance", 0));
         temp.setLastMonthDemand(iter.getInteger("lastMonthDemand", 0));
         temp.setLastYearDemand(iter.getInteger("lastYearDemand", 0));
         temp.setThisMonthMaxCount(iter.getInteger("thisMonthMaxCount", 0));
         temp.setThisMonthMaxBenefitRatio(iter.getInteger("thisMonthMaxBenefitRatio", 0));
         temp.setThisMonthMaxBenefit(iter.getInteger("thisMonthMaxBenefit", 0));
         temp.setTodayMaxCount(iter.getInteger("todayMaxCount", 0));
         temp.setTodayMaxBenefit(iter.getInteger("todayMaxBenefit", 0));
         temp.setThisYearMaxCount(iter.getInteger("thisYearMaxCount", 0));
         temp.setThisYearMaxBenefit(iter.getInteger("thisYearMaxBenefit", 0));
         temp.setMinimumDemand(iter.getInteger("minimumDemand", 0));
         temp.setAtPaymentMaxCount(iter.getInteger("atPaymentMaxCount", 0));
         temp.setAtPaymentMaxBenefit(iter.getInteger("atPaymentMaxBenefit", 0));
         temp.setAtPaymentMaxMoneyApplication(iter.getInteger("atPaymentMaxMoneyApplication", 0));
         brandList.add(temp);
      }
      return brandList;
   }

   private void estimate(List<CreditCard> cardList, HashSet<String> serachCategoryList,
         HashMap<String, Integer> categorySpendPair, int monthlySpend) {
      for (CreditCard iter : cardList) {
         List<Benefits> benefits = iter.getBenefits();
         Estimate cardEstimate = new Estimate();
         ArrayList<Benefit> brandBenefitList = new ArrayList<>();
         ArrayList<NonBenefit> nonBenefitList = new ArrayList<>();
         int total = 0;
         for (Benefits benefit : benefits) {
            String category = benefit.getCategory();
            if (!serachCategoryList.contains(category)) {
               continue;
            }

            Benefit eachBrandBenefit = new Benefit();
            int spendMoney = categorySpendPair.get(category);
            List<BrandList> brandList = benefit.getBrandList();
            BrandList brand = brandList.get(0);
//            System.out.println(brand.getBrand());
            eachBrandBenefit.setBrand(brand.getBrand());
            eachBrandBenefit.setBenefit(brand.getBenefit());
            eachBrandBenefit.setSpendMoney(spendMoney);
            int benefitType = brand.getBenefitType();
            int thisMonthMaxBenefit = 0;
            int estimateMoney = 0;
            switch (benefitType) {
            case 0: // AMOUNT
               double amount = brand.getBenefitAmount();
               int thisMonthMaxCount = brand.getThisMonthMaxCount();
               thisMonthMaxCount = thisMonthMaxCount == 0 ? 1 : 2;
               estimateMoney = (int) amount * thisMonthMaxCount;
               break;
            case 1: // PERCENT
               double percent = brand.getBenefitPercent();
               estimateMoney = (int) (spendMoney * percent / 100);
               break;
            case 2: // LITER
               double benefitPerLiter = brand.getBenefitPerLiter();
               estimateMoney = (int) (spendMoney / PRICE_PER_LITER * benefitPerLiter);
               break;
            case 3: // MILEAGE
               double benefitMileagePerSpend = brand.getBenefitMileagePerSpend();
               estimateMoney = (int) (spendMoney / benefitMileagePerSpend);
               break;
            default:
               System.out.println("benefitType이 없습니다.");
               System.exit(1);
            }
            thisMonthMaxBenefit = brand.getThisMonthMaxBenefit();
            if (thisMonthMaxBenefit != 0)
               estimateMoney = Math.min(thisMonthMaxBenefit, estimateMoney);
            eachBrandBenefit.setBenefitAmount(estimateMoney);
            total += estimateMoney;
            brandBenefitList.add(eachBrandBenefit);

         }
         int limitBenefit = 0;

         List<LimitBenefit> limitBenefitList = iter.getLimitBenefit();
         if (limitBenefitList != null) {
            for (LimitBenefit i : limitBenefitList) {
               int prevPerformance = i.getPrevPerformance();
               if (prevPerformance < monthlySpend && limitBenefit < i.getMaxBenefit()) {
                  limitBenefit = i.getMaxBenefit();
               }
            }
         }
         limitBenefit = limitBenefit == 0 ? -1 : limitBenefit;
         cardEstimate.setTotal(total);
         cardEstimate.setLimitBenefit(limitBenefit);
         cardEstimate.setBenefitList(brandBenefitList);
         cardEstimate.setNoneBenefitList(nonBenefitList);
         iter.setTotalBenefit(total);
         iter.setEstimate(cardEstimate);
      }
   }

   private ArrayList<Integer> insertPollAndReturnSpendList(Poll poll, Transportation transportation,
         Communication communication, GasStation gasStation, Movie movie, CafeBakery cafeBakery,
         Restaurant restaurant, FastFood fastFood, Cafeteria cafeteria, Convenience convenience, Mart mart,
         SuperMarket superMarket, OnLineShopping onLineShopping, Beauty beauty, AmusementPark amusementPark,
         Academy academy, Bookstore bookstore, Medical medical) {

      
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
      
      ArrayList<Integer> spendList = new ArrayList<>();
      spendList.add(convertMoneyUnit(communication.getCommunicationAmount()));
      spendList.add(convertMoneyUnit(restaurant.getRestaurantAmount()));
      spendList.add(convertMoneyUnit(mart.getMartAmount()));
      spendList.add(convertMoneyUnit(beauty.getBeautyAmount()));
      spendList.add(convertMoneyUnit(gasStation.getGasStationAmount()));
      spendList.add(convertMoneyUnit(fastFood.getFastFoodAmount()));
      spendList.add(convertMoneyUnit(superMarket.getSupermarketAmount()));
      spendList.add(convertMoneyUnit(bookstore.getBookstoreAmount()));
      spendList.add(convertMoneyUnit(movie.getMovieAmount()));
      spendList.add(convertMoneyUnit(cafeteria.getCafeteriaAmount()));
      spendList.add(convertMoneyUnit(onLineShopping.getOnlineShoppingAmount()));
      spendList.add(convertMoneyUnit(academy.getAcademyAmount()));
      spendList.add(convertMoneyUnit(transportation.getTransportationAmount()));
      spendList.add(convertMoneyUnit(cafeBakery.getCafeBakeryAmount()));
      spendList.add(convertMoneyUnit(convenience.getConvenienceAmount()));
      spendList.add(convertMoneyUnit(amusementPark.getAmusementParkAmount()));
      spendList.add(convertMoneyUnit(medical.getMedicalAmount()));

      return spendList;
   }

   @RequestMapping(value = "poll.do", method = RequestMethod.GET)
   public String pollForm(HttpSession session) {
      return "recommend/pollForm";
   }

   @RequestMapping(value = "poll.do", method = RequestMethod.POST)
   public String insertPoll(Poll poll, Transportation transportation, Communication communication,
         GasStation gasStation, Movie movie, CafeBakery cafeBakery, Restaurant restaurant, FastFood fastFood,
         Cafeteria cafeteria, Convenience convenience, Mart mart, SuperMarket superMarket,
         OnLineShopping onLineShopping, Beauty beauty, AmusementPark amusementPark, Academy academy,
         Bookstore bookstore, Medical medical, HttpSession session, Model model) {

      if (session.getAttribute("loginUser") == null) {
         poll.setMemberNo(0);
      } else {
         Member member = (Member) session.getAttribute("loginUser");
         poll.setMemberNo(member.getNo());
      }

      System.out.println("설문조사 제출");
      ArrayList<Integer> spendList = insertPollAndReturnSpendList(poll, transportation, communication, gasStation,
            movie, cafeBakery, restaurant, fastFood, cafeteria, convenience, mart, superMarket, onLineShopping,
            beauty, amusementPark, academy, bookstore, medical);

      if (session.getAttribute("loginUser") != null) {
         Member member = (Member) session.getAttribute("loginUser");
         int memberNo = member.getNo();
         int pollNo = recommendService.selectPollNoByMemberNo(memberNo);
         member.setPollNo(pollNo);
         memberService.updatePollNo(member);
         session.setAttribute("userPollNo", pollNo);
      }

      int monthlySpend = convertMoneyUnit(poll.getAmount());
      HashSet<String> searchCategoryList = new HashSet<>();
      HashMap<String, Integer> categorySpendPair = new HashMap<>();
      int temp;
      for (int i = 0; i < CATEGORY_LENGTH; i++) {
         temp = spendList.get(i);
         if (temp == 0)
            continue;

         String category = CATEGORY_LIST.get(i);
         ArrayList<String> categories = CATEGORY_CONVERTER.get(category);
         for (String iter : categories) {
            searchCategoryList.add(iter);
            categorySpendPair.put(iter, temp);
         }
      }
      BasicDBObject query = makeQuery(searchCategoryList, monthlySpend);
      MongoCollection<Document> collection;
      if (poll.getCardtype().equals("credit")) {
         collection = creditCardCollection;
      } else {
         collection = checkCardCollection;
      }
      FindIterable<Document> fi = collection.find(query);
      ArrayList<CreditCard> cardList = getCardList(fi);
      estimate(cardList, searchCategoryList, categorySpendPair, monthlySpend);
      Collections.sort(cardList);
      ArrayList<CreditCard> resultCardList = new ArrayList<CreditCard>(100);
      
      int cardListLength = cardList.size();
      int length = Math.min(cardListLength, 100);
      int[] point = {10, 8, 6, 4, 2};
      for(int i = 0; i < length; i++) {
         resultCardList.add(cardList.get(i));
      }
      int i = 0;
      int max = 5;
      
      if(length < 5){
    	  max = length;
      }
      
      while(i<max){
         RecommendCount recommendCount = new RecommendCount();
         recommendCount.setCardType(poll.getCardtype());
         recommendCount.setBrand(resultCardList.get(i).getBrand());
         recommendCount.setCardNo(resultCardList.get(i).getNo());
         recommendCount.setCommunication(communication.getCommunicationAmount());
         recommendCount.setRestaurant(restaurant.getRestaurantAmount());
         recommendCount.setMart(mart.getMartAmount());
         recommendCount.setBeauty(beauty.getBeautyAmount());
         recommendCount.setGasStation(gasStation.getGasStationAmount());
         recommendCount.setFastFood(fastFood.getFastFoodAmount());
         recommendCount.setSuperMarket(superMarket.getSupermarketAmount());
         recommendCount.setBookstore(bookstore.getBookstoreAmount());
         recommendCount.setMovie(movie.getMovieAmount());
         recommendCount.setCafeteria(cafeteria.getCafeteriaAmount());
         recommendCount.setOnlineShopping(onLineShopping.getOnlineShoppingAmount());
         recommendCount.setAcademy(academy.getAcademyAmount());
         recommendCount.setTransportation(transportation.getTransportationAmount());
         recommendCount.setCafeBakery(cafeBakery.getCafeBakeryAmount());
         recommendCount.setConvenience(convenience.getConvenienceAmount());
         recommendCount.setAmusementPark(amusementPark.getAmusementParkAmount());
         recommendCount.setMedical(medical.getMedicalAmount());
         boolean b = recommendCountService.insertRecommendCount(recommendCount);
         i++;
      }
      
      /*
      System.out.println(resultCardList.get(0));*/
      if(resultCardList.size() == 0 || resultCardList == null){
         model.addAttribute("resultCardList", null);
      }
      else{
         model.addAttribute("resultCardList", resultCardList);
      }
      System.out.println("작업 끝");
      return "recommend/resultPage";
   }
}