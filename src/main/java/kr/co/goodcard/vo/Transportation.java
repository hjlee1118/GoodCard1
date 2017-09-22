package kr.co.goodcard.vo;

public class Transportation {

	private int transportationNo;
	private int transportationAmount;
	
	public Transportation() {
		
	}

	public Transportation(int transportationNo, int transportationAmount) {
		this.transportationNo = transportationNo;
		this.transportationAmount = transportationAmount;
	}

	public int getTransportationNo() {
		return transportationNo;
	}

	public void setTransportationNo(int transportationNo) {
		this.transportationNo = transportationNo;
	}

	public int getTransportationAmount() {
		return transportationAmount;
	}

	public void setTransportationAmount(int transportationAmount) {
		this.transportationAmount = transportationAmount;
	}

	@Override
	public String toString() {
		return "Transportation [transportationNo=" + transportationNo + ", transportationAmount=" + transportationAmount
				+ "]";
	}
	
	
}
