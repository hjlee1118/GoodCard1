package goodcard;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;

import kr.co.goodcard.vo.CheckCard;
import kr.co.goodcard.vo.mongo.AnnualFee;
import kr.co.goodcard.vo.mongo.Benefits;
import kr.co.goodcard.vo.mongo.BrandList;
import kr.co.goodcard.vo.mongo.Detail;
import kr.co.goodcard.vo.mongo.LimitBenefit;
import kr.co.goodcard.vo.mongo.ServiceList;
import kr.co.goodcard.vo.mongo.SpecialService;

public class Test {
	public static void main(String[] args) {
		
		long start = System.currentTimeMillis();
		
		MongoClient mongo = new MongoClient("localhost", 27017);
		DB db = mongo.getDB("hana");

		// get a single collection
		DBCollection collection = db.getCollection("creditCard");
		DBCursor cursor;
		
		BasicDBObject searchQuery = new BasicDBObject();

		cursor = collection.find().limit(1000);

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
		

		long end = System.currentTimeMillis();
		System.out.println(list.size());
		System.out.println("time : " + (end-start));
		
	}
}
