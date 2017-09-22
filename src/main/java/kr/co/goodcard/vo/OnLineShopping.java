package kr.co.goodcard.vo;

public class OnLineShopping {
	
	private int onlineShoppingNo;
	private int onlineShoppingAmount;

	public OnLineShopping() {
	}
	
	public OnLineShopping(int onlineShoppingNo, int onlineShoppingAmount) {
		this.onlineShoppingNo = onlineShoppingNo;
		this.onlineShoppingAmount = onlineShoppingAmount;
	}
	
	public int getOnlineShoppingNo() {
		return onlineShoppingNo;
	}
	
	public void setOnlineShoppingNo(int onlineShoppingNo) {
		this.onlineShoppingNo = onlineShoppingNo;
	}
	
	public int getOnlineShoppingAmount() {
		return onlineShoppingAmount;
	}
	
	public void setOnlineShoppingAmount(int onlineShoppingAmount) {
		this.onlineShoppingAmount = onlineShoppingAmount;
	}
	
	@Override
	public String toString() {
		return "OnLineShopping [onlineShoppingNo=" + onlineShoppingNo + ", onlineShoppingAmount=" + onlineShoppingAmount
				+ "]";
	}
		
}
