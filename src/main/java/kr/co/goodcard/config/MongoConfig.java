package kr.co.goodcard.config;

import com.mongodb.MongoClient;

public final class MongoConfig{
  
	public static String getDatabaseName() {
        return "hana";
    }
  
    public static MongoClient mongo(){
        return new MongoClient("13.124.121.245", 27017);
    }
  
    protected String getMappingBasePackage() {
        return "kr.co.goodcard";
    }
}