package goodcard;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.util.JSON;

import kr.co.goodcard.vo.CreditCard;
import kr.co.goodcard.vo.mongo.AnnualFee;
import kr.co.goodcard.vo.mongo.Benefits;
import kr.co.goodcard.vo.mongo.LimitBenefit;
import kr.co.goodcard.vo.mongo.SpecialService;

import org.json.*;

@RunWith(JUnit4.class)
public class MongoDBTest {


	@Test
	public void findDB() {

		MongoClient mongo = new MongoClient("13.124.174.15", 27017);
		DB db = mongo.getDB("hana");

		// get a single collection
		DBCollection collection = db.getCollection("creditCard");

		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("brand", "하나카드");

		DBCursor cursor = collection.find(searchQuery);

		
		List<CreditCard> list = new ArrayList<>();
		 
		int index = 1;
		 
		 while(cursor.hasNext()){ 
		
			 BasicDBObject cardDBObject = (BasicDBObject) cursor.next();
			CreditCard creditCard = new CreditCard();

			creditCard.setId(cardDBObject.getString("_id"));
			creditCard.setBrand(cardDBObject.getString("brand"));
			creditCard.setCardType(cardDBObject.getString("cardType"));
			creditCard.setCardName(cardDBObject.getString("cardName"));
			creditCard.setAnnotation(cardDBObject.getString("annotation"));
			creditCard.setImagePath(cardDBObject.getString("imagePath"));
			creditCard.setAnnualFee((List<AnnualFee>) cardDBObject.get("annualFee"));
			creditCard.setLimitBenefit((List<LimitBenefit>) cardDBObject.get("limitBenefit"));
			creditCard.setSpecialServices((List<SpecialService>) cardDBObject.get("specialService"));
			creditCard.setBenefits((List<Benefits>) cardDBObject.get("benefits"));
			creditCard.setViewCount(cardDBObject.getInt("viewCount"));

			list.add(creditCard);
		}
		 
		 
		 /*
		 for(CreditCard c : list){
		 System.out.println("-----------------------------");
		 System.out.println(c.getBrand());
		 System.out.println(c.getCardType());
		 System.out.println(c.getCardName());
		 System.out.println(c.getAnnotation());
		 System.out.println(c.getAnnualFee().get(0).getBrand()); }*/
		 
/*		JsonArray sendArray = new JsonArray();
		 
		 int index = 1;*/
		 
		/*while (cursor.hasNext()) {
			BasicDBObject cardDBObject = (BasicDBObject) cursor.next();
			CreditCard creditCard = new CreditCard();
			JsonObject sendObject = new JsonObject();

			creditCard.setId(cardDBObject.getString("_id"));
			creditCard.setBrand(cardDBObject.getString("brand"));
			creditCard.setCardType(cardDBObject.getString("cardType"));
			creditCard.setCardName(cardDBObject.getString("cardName"));
			creditCard.setAnnotation(cardDBObject.getString("annotation"));
			creditCard.setImagePath(cardDBObject.getString("imagePath"));
			creditCard.setAnnualFee((List<AnnualFee>) cardDBObject.get("annualFee"));
			creditCard.setLimitBenefit((List<LimitBenefit>) cardDBObject.get("limitBenefit"));
			creditCard.setSpecialServices((List<SpecialService>) cardDBObject.get("specialService"));
			creditCard.setBenefits((List<Benefits>) cardDBObject.get("benefits"));
			creditCard.setViewCount(cardDBObject.getInt("viewCount"));
			
			
			JSONObject jsonObject = new JSONObject(cursor.next().toString());
			
			sendObject.add("_id", (JsonElement) jsonObject.get("_id"));
			break;
			
		}*/
		 
		

		

	}
}