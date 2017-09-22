package kr.co.goodcard.service;

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

public interface RecommendService {
	
	boolean insertPoll(Poll poll);
	boolean insertTransportation(Transportation transportation);
	boolean insertCommunication(Communication communication);
	boolean insertGasStation(GasStation gasStation);
	boolean insertMovie(Movie movie);
	
	boolean insertCafeBakery(CafeBakery cafeBakery);
	boolean insertRestaurant(Restaurant restaurant);
	boolean insertFastFood(FastFood fastFood);		
	boolean insertCafeteria(Cafeteria cafeteria);
	
	boolean insertConvenience(Convenience convenience);
	boolean insertMart(Mart mart);
	boolean insertSuperMarket(SuperMarket superMarket);
	boolean insertOnLineShopping(OnLineShopping onLineShopping);
	
	boolean insertBeauty(Beauty beauty);		
	boolean insertAmusementPark(AmusementPark amusementPark);
	boolean insertAcademy(Academy academy);
	boolean insertBookstore(Bookstore bookstore);
	boolean insertMedical(Medical medical);
	int selectPollNoByMemberNo(int memberNo);

}
