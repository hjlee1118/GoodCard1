package kr.co.goodcard.vo;

public class Medical {

	private int medicalNo;
	private int medicalAmount;
	
	public Medical() {
		
	}
		
	public Medical(int medicalNo, int medicalAmount) {
		this.medicalNo = medicalNo;
		this.medicalAmount = medicalAmount;
	}

	public int getMedicalNo() {
		return medicalNo;
	}

	public void setMedicalNo(int medicalNo) {
		this.medicalNo = medicalNo;
	}

	public int getMedicalAmount() {
		return medicalAmount;
	}

	public void setMedicalAmount(int medicalAmount) {
		this.medicalAmount = medicalAmount;
	}

	@Override
	public String toString() {
		return "Medical [medicalNo=" + medicalNo + ", medicalAmount=" + medicalAmount + "]";
	}
		
}
