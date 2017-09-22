package kr.co.goodcard.service;

import kr.co.goodcard.vo.Member;

public interface CardService {

	boolean insertMyCard(String id, Member member);

	boolean deleteMyCard(String id, Member member);

}
