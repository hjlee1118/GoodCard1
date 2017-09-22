package kr.co.goodcard.service;

import kr.co.goodcard.vo.Member;

public interface MemberService {

	boolean insertMember(Member member);

	Member login(Member member);

	int checkId(String currentId);
	
	boolean updatePollNo(Member member);

}
