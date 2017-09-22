package kr.co.goodcard.dao;

import org.springframework.stereotype.Repository;

import kr.co.goodcard.vo.Member;

@Repository
public interface MemberDAO {

	int insertMember(Member member);

	Member login(Member member);

	int checkId(String currentId);
	
	boolean updatePollNo(Member member);

}
