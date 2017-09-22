package kr.co.goodcard.vo.mongo;

public class AnnualFee {
	
	private String brand;
	private int fee;
	
	public AnnualFee() {

	}
	
	public AnnualFee(String brand, int fee) {
		this.brand = brand;
		this.fee = fee;
	}
	
	public String getBrand() {
		return brand;
	}
	
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public int getFee() {
		return fee;
	}
	
	public void setFee(int fee) {
		this.fee = fee;
	}
	
	@Override
	public String toString() {
		return "AnnualFee [brand=" + brand + ", fee=" + fee + "]";
	}
	
}
