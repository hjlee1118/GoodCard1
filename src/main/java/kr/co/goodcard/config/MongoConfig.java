package kr.co.goodcard.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.config.AbstractMongoConfiguration;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import com.mongodb.Mongo;
import com.mongodb.MongoClient;

@Configuration
@EnableMongoRepositories(basePackages = "kr.co.goodcard.mongo.repositories")
public class MongoConfig extends AbstractMongoConfiguration {
  
    @Override
    protected String getDatabaseName() {
        return "hana";
    }
  
    @Override
    public Mongo mongo() throws Exception {
        return new MongoClient("13.125.7.180", 27017);
    }
  
    @Override
    protected String getMappingBasePackage() {
        return "kr.co.goodcard";
    }
}