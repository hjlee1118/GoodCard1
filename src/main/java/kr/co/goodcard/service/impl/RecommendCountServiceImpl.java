package kr.co.goodcard.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodcard.dao.RecommendCountDAO;
import kr.co.goodcard.service.RecommendCountService;
import kr.co.goodcard.vo.RecommendCount;

@Service
public class RecommendCountServiceImpl implements RecommendCountService {
	
	@Autowired
	RecommendCountDAO recommendCountDAO;

	@Override
	public boolean insertRecommendCount(RecommendCount recommendCount) {
		return recommendCountDAO.insertRecommendCount(recommendCount);
	}
}
