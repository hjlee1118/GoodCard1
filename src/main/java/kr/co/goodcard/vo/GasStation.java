package kr.co.goodcard.vo;

public class GasStation {
	
	private int gasStationNo;
	private int gasStationAmount;
	
	public GasStation() {
		
	}
	
	public GasStation(int gasStationNo, int gasStationAmount) {
		this.gasStationNo = gasStationNo;
		this.gasStationAmount = gasStationAmount;
	}

	public int getGasStationNo() {
		return gasStationNo;
	}

	public void setGasStationNo(int gasStationNo) {
		this.gasStationNo = gasStationNo;
	}

	public int getGasStationAmount() {
		return gasStationAmount;
	}

	public void setGasStationAmount(int gasStationAmount) {
		this.gasStationAmount = gasStationAmount;
	}

	@Override
	public String toString() {
		return "GasStation [gasStationNo=" + gasStationNo + ", gasStationAmount=" + gasStationAmount + "]";
	}
		
}
