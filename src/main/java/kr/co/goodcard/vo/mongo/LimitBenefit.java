package kr.co.goodcard.vo.mongo;

public class LimitBenefit {
	
	private int prevPerformance;
	private int maxBenefit;
	
	public LimitBenefit() {

	}
	
	public LimitBenefit(int prevPerformance, int maxBenefit) {
		this.prevPerformance = prevPerformance;
		this.maxBenefit = maxBenefit;
	}
	
	public int getPrevPerformance() {
		return prevPerformance;
	}
	
	public void setPrevPerformance(int prevPerformance) {
		this.prevPerformance = prevPerformance;
	}
	
	public int getMaxBenefit() {
		return maxBenefit;
	}

	public void setMaxBenefit(int maxBenefit) {
		this.maxBenefit = maxBenefit;
	}

	@Override
	public String toString() {
		return "LimitBenefit [prevPerformance=" + prevPerformance + ", maxBenefit=" + maxBenefit + "]";
	}
}
