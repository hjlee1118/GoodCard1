package kr.co.goodcard.dao;

import org.springframework.stereotype.Repository;

import kr.co.goodcard.vo.Age;
import kr.co.goodcard.vo.SearchKeyword;

@Repository
public interface SearchKeywordDAO {

	boolean insertSearchKeyword(SearchKeyword searchKeyword);
	
	SearchKeyword getBestBenefit(String cardType);

	SearchKeyword getBestBenefitByAge(Age age);

}
