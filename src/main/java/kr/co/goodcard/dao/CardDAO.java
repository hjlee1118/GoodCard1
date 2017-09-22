package kr.co.goodcard.dao;

import org.springframework.stereotype.Repository;

import kr.co.goodcard.vo.Member;

@Repository
public interface CardDAO {

	boolean insertMyCard1(Member member);
	boolean insertMyCard2(Member member);
	boolean insertMyCard3(Member member);
	
	boolean deleteMyCard1(Member member);
	boolean deleteMyCard2(Member member);
	boolean deleteMyCard3(Member member);

}
