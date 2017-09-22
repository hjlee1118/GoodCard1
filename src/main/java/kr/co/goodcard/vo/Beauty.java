package kr.co.goodcard.vo;

public class Beauty {
	
	private int beautyNo;
	private int beautyAmount;
	
	public Beauty() {
		
	}
	
	public Beauty(int beautyNo, int beautyAmount) {
		this.beautyNo = beautyNo;
		this.beautyAmount = beautyAmount;
	}
	
	public int getBeautyNo() {
		return beautyNo;
	}
	
	public void setBeautyNo(int beautyNo) {
		this.beautyNo = beautyNo;
	}
	
	public int getBeautyAmount() {
		return beautyAmount;
	}
	
	public void setBeautyAmount(int beautyAmount) {
		this.beautyAmount = beautyAmount;
	}
	
	@Override
	public String toString() {
		return "Beauty [beautyNo=" + beautyNo + ", beautyAmount=" + beautyAmount + "]";
	}
}
