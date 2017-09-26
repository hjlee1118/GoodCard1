package kr.co.goodcard.vo;

public class Age {
	
	private int startAge;
	private int endAge;
	
	public Age() {

	}
	
	public Age(int startAge, int endAge) {
		this.startAge = startAge;
		this.endAge = endAge;
	}

	public int getStartAge() {
		return startAge;
	}

	public void setStartAge(int startAge) {
		this.startAge = startAge;
	}

	public int getEndAge() {
		return endAge;
	}

	public void setEndAge(int endAge) {
		this.endAge = endAge;
	}

	@Override
	public String toString() {
		return "Age [startAge=" + startAge + ", endAge=" + endAge + "]";
	}
	
}
