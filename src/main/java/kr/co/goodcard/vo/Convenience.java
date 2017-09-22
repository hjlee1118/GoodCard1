package kr.co.goodcard.vo;

public class Convenience {

	private int convenienceNo;
	private int convenienceAmount;
	
	public Convenience() {
	
	}
	
	public Convenience(int convenienceNo, int convenienceAmount) {
		this.convenienceNo = convenienceNo;
		this.convenienceAmount = convenienceAmount;
	}

	public int getConvenienceNo() {
		return convenienceNo;
	}

	public void setConvenienceNo(int convenienceNo) {
		this.convenienceNo = convenienceNo;
	}

	public int getConvenienceAmount() {
		return convenienceAmount;
	}

	public void setConvenienceAmount(int convenienceAmount) {
		this.convenienceAmount = convenienceAmount;
	}

	@Override
	public String toString() {
		return "Convenience [convenienceNo=" + convenienceNo + ", convenienceAmount=" + convenienceAmount + "]";
	}		
}
