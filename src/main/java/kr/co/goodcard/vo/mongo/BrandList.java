package kr.co.goodcard.vo.mongo;

public class BrandList {
	
	private String brand;
	private String benefit;
	private int prevPerformance;
	private String constraint;
	
	public BrandList() {

	}
	
	public BrandList(String brand, String benefit, int prevPerformance, String constraint) {
		this.brand = brand;
		this.benefit = benefit;
		this.prevPerformance = prevPerformance;
		this.constraint = constraint;
	}
	
	public String getBrand() {
		return brand;
	}
	
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public String getBenefit() {
		return benefit;
	}
	
	public void setBenefit(String benefit) {
		this.benefit = benefit;
	}
	
	public int getPrevPerformance() {
		return prevPerformance;
	}
	
	public void setPrevPerformance(int prevPerformance) {
		this.prevPerformance = prevPerformance;
	}
	
	public String getConstraint() {
		return constraint;
	}
	
	public void setConstraint(String constraint) {
		this.constraint = constraint;
	}

	@Override
	public String toString() {
		return "BrandList [brand=" + brand + ", benefit=" + benefit + ", prevPerformance=" + prevPerformance
				+ ", constraint=" + constraint + "]";
	}
}
