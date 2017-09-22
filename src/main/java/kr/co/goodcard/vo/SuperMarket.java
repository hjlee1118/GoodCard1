package kr.co.goodcard.vo;

public class SuperMarket {
	
	private int supermarketNo;
	private int supermarketAmount;
	
	public SuperMarket() {
	}

	public SuperMarket(int supermarketNo, int supermarketAmount) {
		this.supermarketNo = supermarketNo;
		this.supermarketAmount = supermarketAmount;
	}

	public int getSupermarketNo() {
		return supermarketNo;
	}

	public void setSupermarketNo(int supermarketNo) {
		this.supermarketNo = supermarketNo;
	}

	public int getSupermarketAmount() {
		return supermarketAmount;
	}

	public void setSupermarketAmount(int supermarketAmount) {
		this.supermarketAmount = supermarketAmount;
	}

	@Override
	public String toString() {
		return "SuperMarket [supermarketNo=" + supermarketNo + ", supermarketAmount=" + supermarketAmount + "]";
	}
	
}
