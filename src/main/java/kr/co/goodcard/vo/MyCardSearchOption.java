package kr.co.goodcard.vo;

public class MyCardSearchOption {
	
	private String cardType;
	private String searchType;
	private int creditCardBrand;
	private int checkCardBrand;
	private String myCardsearchInput;
	
	public MyCardSearchOption() {
	
	}

	public MyCardSearchOption(String cardType, String searchType, int creditCardBrand, int checkCardBrand,
			String myCardsearchInput) {
		this.cardType = cardType;
		this.searchType = searchType;
		this.creditCardBrand = creditCardBrand;
		this.checkCardBrand = checkCardBrand;
		this.myCardsearchInput = myCardsearchInput;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public int getCreditCardBrand() {
		return creditCardBrand;
	}

	public void setCreditCardBrand(int creditCardBrand) {
		this.creditCardBrand = creditCardBrand;
	}

	public int getCheckCardBrand() {
		return checkCardBrand;
	}

	public void setCheckCardBrand(int checkCardBrand) {
		this.checkCardBrand = checkCardBrand;
	}

	public String getMyCardsearchInput() {
		return myCardsearchInput;
	}

	public void setMyCardsearchInput(String myCardsearchInput) {
		this.myCardsearchInput = myCardsearchInput;
	}

	@Override
	public String toString() {
		return "MyCardSearchOption [cardType=" + cardType + ", searchType=" + searchType + ", creditCardBrand="
				+ creditCardBrand + ", checkCardBrand=" + checkCardBrand + ", myCardsearchInput=" + myCardsearchInput
				+ "]";
	}
}
