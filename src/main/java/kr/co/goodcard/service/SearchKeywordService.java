package kr.co.goodcard.service;

import java.util.List;

import kr.co.goodcard.vo.Member;
import kr.co.goodcard.vo.SearchKeyword;

public interface SearchKeywordService {
	

	boolean insertSearchKeyword(Member member, List<String> list, String cardType);

}
