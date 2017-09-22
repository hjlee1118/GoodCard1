package kr.co.goodcard.dao;

import org.springframework.stereotype.Repository;

import kr.co.goodcard.vo.*;


@Repository
public interface RecommendDAO {
	
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
