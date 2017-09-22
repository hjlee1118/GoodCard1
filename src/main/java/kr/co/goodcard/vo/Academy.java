package kr.co.goodcard.vo;

public class Academy {
	
	private int academyNo;
	private int academyAmount;
	
	public Academy() {
	
	}

	public Academy(int academyNo, int academyAmount) {
		this.academyNo = academyNo;
		this.academyAmount = academyAmount;
	}

	public int getAcademyNo() {
		return academyNo;
	}

	public void setAcademyNo(int academyNo) {
		this.academyNo = academyNo;
	}

	public int getAcademyAmount() {
		return academyAmount;
	}

	public void setAcademyAmount(int academyAmount) {
		this.academyAmount = academyAmount;
	}

	@Override
	public String toString() {
		return "Academy [academyNo=" + academyNo + ", academyAmount=" + academyAmount + "]";
	}
}
