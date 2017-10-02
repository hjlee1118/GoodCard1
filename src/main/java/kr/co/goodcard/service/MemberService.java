package kr.co.goodcard.service;

import kr.co.goodcard.vo.Member;

public interface MemberService {

	//Create
	boolean insertMember(Member member);

	//Read
	Member login(Member member);
	int checkId(String currentId);
	
	//Update
	boolean updatePollNo(Member member);
	boolean updateMember(Member member);

}
