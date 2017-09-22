package kr.co.goodcard.vo;

public class SearchKeyword {
	
	private int no;
	private int age;
	private String cardType;
	private int communication;
	private int restaurant;
	private int mart;
	private int beauty;
	private int gasStation;
	private int fastFood;
	private int superMarket;
	private int bookstore;
	private int movie;
	private int cafeteria;
	private int onlineShopping;
	private int academy;
	private int transportation;
	private int cafe;
	private int convenience;
	private int amusementPark;
	private int medical;
	
	public SearchKeyword() {

	}
	
	public SearchKeyword(int no, int age, String cardType, int communication, int restaurant, int mart, int beauty,
			int gasStation, int fastFood, int superMarket, int bookstore, int movie, int cafeteria, int onlineShopping,
			int academy, int transportation, int cafe, int convenience, int amusementPark, int medical) {
		this.no = no;
		this.age = age;
		this.cardType = cardType;
		this.communication = communication;
		this.restaurant = restaurant;
		this.mart = mart;
		this.beauty = beauty;
		this.gasStation = gasStation;
		this.fastFood = fastFood;
		this.superMarket = superMarket;
		this.bookstore = bookstore;
		this.movie = movie;
		this.cafeteria = cafeteria;
		this.onlineShopping = onlineShopping;
		this.academy = academy;
		this.transportation = transportation;
		this.cafe = cafe;
		this.convenience = convenience;
		this.amusementPark = amusementPark;
		this.medical = medical;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public int getCommunication() {
		return communication;
	}

	public void setCommunication(int communication) {
		this.communication = communication;
	}

	public int getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(int restaurant) {
		this.restaurant = restaurant;
	}

	public int getMart() {
		return mart;
	}

	public void setMart(int mart) {
		this.mart = mart;
	}

	public int getBeauty() {
		return beauty;
	}

	public void setBeauty(int beauty) {
		this.beauty = beauty;
	}

	public int getGasStation() {
		return gasStation;
	}

	public void setGasStation(int gasStation) {
		this.gasStation = gasStation;
	}

	public int getFastFood() {
		return fastFood;
	}

	public void setFastFood(int fastFood) {
		this.fastFood = fastFood;
	}

	public int getSuperMarket() {
		return superMarket;
	}

	public void setSuperMarket(int superMarket) {
		this.superMarket = superMarket;
	}

	public int getBookstore() {
		return bookstore;
	}

	public void setBookstore(int bookstore) {
		this.bookstore = bookstore;
	}

	public int getMovie() {
		return movie;
	}

	public void setMovie(int movie) {
		this.movie = movie;
	}

	public int getCafeteria() {
		return cafeteria;
	}

	public void setCafeteria(int cafeteria) {
		this.cafeteria = cafeteria;
	}

	public int getOnlineShopping() {
		return onlineShopping;
	}

	public void setOnlineShopping(int onlineShopping) {
		this.onlineShopping = onlineShopping;
	}

	public int getAcademy() {
		return academy;
	}

	public void setAcademy(int academy) {
		this.academy = academy;
	}

	public int getTransportation() {
		return transportation;
	}

	public void setTransportation(int transportation) {
		this.transportation = transportation;
	}

	public int getCafe() {
		return cafe;
	}

	public void setCafe(int cafe) {
		this.cafe = cafe;
	}

	public int getConvenience() {
		return convenience;
	}

	public void setConvenience(int convenience) {
		this.convenience = convenience;
	}

	public int getAmusementPark() {
		return amusementPark;
	}

	public void setAmusementPark(int amusementPark) {
		this.amusementPark = amusementPark;
	}

	public int getMedical() {
		return medical;
	}

	public void setMedical(int medical) {
		this.medical = medical;
	}

	@Override
	public String toString() {
		return "SearchKeyword [no=" + no + ", age=" + age + ", cardType=" + cardType + ", communication="
				+ communication + ", restaurant=" + restaurant + ", mart=" + mart + ", beauty=" + beauty
				+ ", gasStation=" + gasStation + ", fastFood=" + fastFood + ", superMarket=" + superMarket
				+ ", bookstore=" + bookstore + ", movie=" + movie + ", cafeteria=" + cafeteria + ", onlineShopping="
				+ onlineShopping + ", academy=" + academy + ", transportation=" + transportation + ", cafe=" + cafe
				+ ", convenience=" + convenience + ", amusementPark=" + amusementPark + ", medical=" + medical + "]";
	}

}
