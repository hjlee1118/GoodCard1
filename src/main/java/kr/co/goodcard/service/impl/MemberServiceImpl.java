package kr.co.goodcard.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodcard.dao.MemberDAO;
import kr.co.goodcard.service.MemberService;
import kr.co.goodcard.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	public boolean insertMember(Member member) {

		int result = 0;
		result = memberDAO.insertMember(member);
		if (result > 0) {
			return true;
		}
		return false;
	}

	public Member login(Member member) {
		member = memberDAO.login(member);
		return member;
	}

	public int checkId(String currentId) {
		int count = memberDAO.checkId(currentId);
		System.out.println(count);
		
		return count;
	}

	public boolean updatePollNo(Member member) {
		boolean b = memberDAO.updatePollNo(member);
		return b;
	}	

}
