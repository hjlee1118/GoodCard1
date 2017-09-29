package kr.co.goodcard.vo;

public class Benefit {
	String brand;
	String benefit;
	int benefitAmount;
	int spendMoney;
	
	public Benefit() {
		super();
	}

	public Benefit(String brand, String benefit, int benefitAmount, int spendMoney) {
		super();
		this.brand = brand;
		this.benefit = benefit;
		this.benefitAmount = benefitAmount;
		this.spendMoney = spendMoney;
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

	public int getBenefitAmount() {
		return benefitAmount;
	}

	public void setBenefitAmount(int benefitAmount) {
		this.benefitAmount = benefitAmount;
	}

	public int getSpendMoney() {
		return spendMoney;
	}

	public void setSpendMoney(int spendMoney) {
		this.spendMoney = spendMoney;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Benefit [brand=");
		builder.append(brand);
		builder.append(", benefit=");
		builder.append(benefit);
		builder.append(", benefitAmount=");
		builder.append(benefitAmount);
		builder.append(", spendMoney=");
		builder.append(spendMoney);
		builder.append("]");
		return builder.toString();
	}
	
}
