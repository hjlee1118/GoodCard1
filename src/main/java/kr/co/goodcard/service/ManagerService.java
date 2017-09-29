package kr.co.goodcard.service;

import java.util.List;

import kr.co.goodcard.vo.Age;
import kr.co.goodcard.vo.CheckCard;
import kr.co.goodcard.vo.CreditCard;

public interface ManagerService {

	List<String> getCreditBestBenefit();
	
	List<String> getCheckBestBenefit();

	List<String> getBestBenefitByAge(Age age);

	List<CreditCard> getCreditCardRank();

	List<CheckCard> getCheckCardRank();
}
