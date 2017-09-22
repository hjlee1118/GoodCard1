package kr.co.goodcard.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodcard.dao.CardDAO;
import kr.co.goodcard.service.CardService;
import kr.co.goodcard.vo.Member;

@Service
public class CardServiceImpl implements CardService {
	
	@Autowired
	CardDAO cardDAO;

	@Override
	public boolean insertMyCard(String id, Member member) {
		
		if(member.getCard1() == null || member.getCard1().equals("")) {
			member.setCard1(id);
			cardDAO.insertMyCard1(member);
			return true;
		}
		
		if (member.getCard2() == null || member.getCard2().equals("")) {
			member.setCard2(id);
			cardDAO.insertMyCard2(member);
			return true;
		}
		
		if (member.getCard3() == null || member.getCard3().equals("")) {
			member.setCard3(id);
			cardDAO.insertMyCard3(member);
			return true;
		}
		
		return false;
	}

	@Override
	public boolean deleteMyCard(String id, Member member) {
		if(member.getCard1() != null && member.getCard1().equals(id)) {
			cardDAO.deleteMyCard1(member);
			return true;
		}
		
		else if (member.getCard2() != null && member.getCard2().equals(id)) {
			cardDAO.deleteMyCard2(member);
			return true;
		}		
		else if(member.getCard3() != null && member.getCard3().equals(id)){
			cardDAO.deleteMyCard3(member);
			return true;
		}
		else{
			return false;
		}
	}

}
