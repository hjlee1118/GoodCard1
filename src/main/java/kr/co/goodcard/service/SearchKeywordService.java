package kr.co.goodcard.service;

import java.util.List;

import kr.co.goodcard.vo.Member;
import kr.co.goodcard.vo.SearchKeyword;

public interface SearchKeywordService {
	

	boolean insertSearchKeyword(List<String> list, int age, String cardType);

}
