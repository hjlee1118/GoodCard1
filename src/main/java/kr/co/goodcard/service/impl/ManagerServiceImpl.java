package kr.co.goodcard.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodcard.dao.SearchKeywordDAO;
import kr.co.goodcard.service.ManagerService;
import kr.co.goodcard.util.Util;
import kr.co.goodcard.vo.Age;
import kr.co.goodcard.vo.SearchKeyword;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	SearchKeywordDAO searchKeywordDAO;

	@Override
	public List<String> getCreditBestBenefit() {
		
		SearchKeyword searchKeyword = searchKeywordDAO.getBestBenefit("credit");
		Map<String, Integer> hashMap = Util.mappingByKey(searchKeyword);
		List<String> list = Util.sortByValue(hashMap);
		
		return list;
	}
	
	@Override
	public List<String> getCheckBestBenefit() {
		
		SearchKeyword searchKeyword = searchKeywordDAO.getBestBenefit("check");
		Map<String, Integer> hashMap = Util.mappingByKey(searchKeyword);
		List<String> list = Util.sortByValue(hashMap);
		
		return list;
	}

	@Override
	public List<String> getBestBenefitByAge(Age age) {
		
		SearchKeyword searchKeyword = searchKeywordDAO.getBestBenefitByAge(age);
		Map<String, Integer> hashMap = Util.mappingByKey(searchKeyword);
		List<String> list = Util.sortByValue(hashMap);
		
		return list;
	}

}
