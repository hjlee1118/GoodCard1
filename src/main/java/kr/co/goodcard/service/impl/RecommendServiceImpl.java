package kr.co.goodcard.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodcard.dao.RecommendDAO;
import kr.co.goodcard.service.RecommendService;
import kr.co.goodcard.vo.Academy;
import kr.co.goodcard.vo.AmusementPark;
import kr.co.goodcard.vo.Beauty;
import kr.co.goodcard.vo.Bookstore;
import kr.co.goodcard.vo.CafeBakery;
import kr.co.goodcard.vo.Cafeteria;
import kr.co.goodcard.vo.Communication;
import kr.co.goodcard.vo.Convenience;
import kr.co.goodcard.vo.FastFood;
import kr.co.goodcard.vo.GasStation;
import kr.co.goodcard.vo.Mart;
import kr.co.goodcard.vo.Medical;
import kr.co.goodcard.vo.Movie;
import kr.co.goodcard.vo.OnLineShopping;
import kr.co.goodcard.vo.Poll;
import kr.co.goodcard.vo.Restaurant;
import kr.co.goodcard.vo.SuperMarket;
import kr.co.goodcard.vo.Transportation;

@Service
public class RecommendServiceImpl implements RecommendService{
	
	@Autowired
	RecommendDAO recommendDAO;

	public boolean insertPoll(Poll poll) {
		boolean b = recommendDAO.insertPoll(poll);
		return b;
	}

	public boolean insertTransportation(Transportation transportation) {
		boolean b = recommendDAO.insertTransportation(transportation);
		return b;
	}

	public boolean insertCommunication(Communication communication) {
		boolean b = recommendDAO.insertCommunication(communication);
		return b;
	}

	public boolean insertGasStation(GasStation gasStation) {
		boolean b = recommendDAO.insertGasStation(gasStation);
		return b;
	}

	public boolean insertMovie(Movie movie) {
		boolean b = recommendDAO.insertMovie(movie);
		return b;
	}

	public boolean insertCafeBakery(CafeBakery cafeBakery) {
		boolean b = recommendDAO.insertCafeBakery(cafeBakery);
		return b;
	}

	public boolean insertRestaurant(Restaurant restaurant) {
		boolean b = recommendDAO.insertRestaurant(restaurant);
		return b;
	}

	public boolean insertFastFood(FastFood fastFood) {
		boolean b = recommendDAO.insertFastFood(fastFood);
		return b;
	}

	public boolean insertCafeteria(Cafeteria cafeteria) {
		boolean b = recommendDAO.insertCafeteria(cafeteria);
		return b;
	}

	public boolean insertConvenience(Convenience convenience) {
		boolean b = recommendDAO.insertConvenience(convenience);
		return b;
	}

	public boolean insertMart(Mart mart) {
		boolean b = recommendDAO.insertMart(mart);
		return b;
	}

	public boolean insertSuperMarket(SuperMarket superMarket) {
		boolean b = recommendDAO.insertSuperMarket(superMarket);
		return b;
	}

	public boolean insertOnLineShopping(OnLineShopping onLineShopping) {
		boolean b = recommendDAO.insertOnLineShopping(onLineShopping);
		return b;
	}

	public boolean insertBeauty(Beauty beauty) {
		boolean b = recommendDAO.insertBeauty(beauty);
		return b;
	}

	public boolean insertAmusementPark(AmusementPark amusementPark) {
		boolean b = recommendDAO.insertAmusementPark(amusementPark);
		return b;
	}

	public boolean insertAcademy(Academy academy) {
		boolean b = recommendDAO.insertAcademy(academy);
		return b;
	}

	public boolean insertBookstore(Bookstore bookstore) {
		boolean b = recommendDAO.insertBookstore(bookstore);
		return b;
	}

	public boolean insertMedical(Medical medical) {
		boolean b = recommendDAO.insertMedical(medical);
		return b;
	}

	public int selectPollNoByMemberNo(int memberNo) {
		int pollNo = recommendDAO.selectPollNoByMemberNo(memberNo);
		return pollNo;
	}

}
