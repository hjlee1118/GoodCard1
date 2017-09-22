package kr.co.goodcard.vo;

public class AmusementPark {

	private int amusementParkNo;
	private int amusementParkAmount;
	
	public AmusementPark() {
		
	}
	
	public AmusementPark(int amusementParkNo, int amusementParkAmount) {
		this.amusementParkNo = amusementParkNo;
		this.amusementParkAmount = amusementParkAmount;
	}

	public int getAmusementParkNo() {
		return amusementParkNo;
	}

	public void setAmusementParkNo(int amusementParkNo) {
		this.amusementParkNo = amusementParkNo;
	}

	public int getAmusementParkAmount() {
		return amusementParkAmount;
	}

	public void setAmusementParkAmount(int amusementParkAmount) {
		this.amusementParkAmount = amusementParkAmount;
	}

	@Override
	public String toString() {
		return "AmusementPark [amusementParkNo=" + amusementParkNo + ", amusementParkAmount=" + amusementParkAmount
				+ "]";
	}
}
