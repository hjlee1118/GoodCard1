package kr.co.goodcard.dao;

import org.springframework.stereotype.Repository;

import kr.co.goodcard.vo.RecommendCount;

@Repository
public interface RecommendCountDAO {

	boolean insertRecommendCount(RecommendCount recommendCount);

}
