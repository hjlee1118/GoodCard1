package kr.co.goodcard.vo;

public class Mart {

	private int martNo;
	private int martAmount;
	
	public Mart() {
		
	}
	
	public Mart(int martNo, int martAmount) {
		this.martNo = martNo;
		this.martAmount = martAmount;
	}

	public int getMartNo() {
		return martNo;
	}

	public void setMartNo(int martNo) {
		this.martNo = martNo;
	}

	public int getMartAmount() {
		return martAmount;
	}

	public void setMartAmount(int martAmount) {
		this.martAmount = martAmount;
	}

	@Override
	public String toString() {
		return "Mart [martNo=" + martNo + ", martAmount=" + martAmount + "]";
	}
	
}
