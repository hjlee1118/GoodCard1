package kr.co.goodcard.vo;

public class Cafeteria {
	
	private int cafeteriaNo;
	private int cafeteriaAmount;
	
	public Cafeteria() {
		
	}

	public Cafeteria(int cafeteriaNo, int cafeteriaAmount) {
		this.cafeteriaNo = cafeteriaNo;
		this.cafeteriaAmount = cafeteriaAmount;
	}

	public int getCafeteriaNo() {
		return cafeteriaNo;
	}

	public void setCafeteriaNo(int cafeteriaNo) {
		this.cafeteriaNo = cafeteriaNo;
	}

	public int getCafeteriaAmount() {
		return cafeteriaAmount;
	}

	public void setCafeteriaAmount(int cafeteriaAmount) {
		this.cafeteriaAmount = cafeteriaAmount;
	}

	@Override
	public String toString() {
		return "Cafeteria [cafeteriaNo=" + cafeteriaNo + ", cafeteriaAmount=" + cafeteriaAmount + "]";
	}		
}
