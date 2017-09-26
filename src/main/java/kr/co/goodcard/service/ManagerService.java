package kr.co.goodcard.service;

import java.util.List;

import kr.co.goodcard.vo.Age;

public interface ManagerService {

	List<String> getCreditBestBenefit();
	
	List<String> getCheckBestBenefit();

	List<String> getBestBenefitByAge(Age age);

}
