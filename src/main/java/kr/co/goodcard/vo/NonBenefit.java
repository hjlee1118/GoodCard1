package kr.co.goodcard.vo;

public class NonBenefit {
	String category;
	int spendMoney;
	
	public NonBenefit() {
		super();
	}
	
	public NonBenefit(String category, int spendMoney) {
		super();
		this.category = category;
		this.spendMoney = spendMoney;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
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
		builder.append("NonBenefit [category=");
		builder.append(category);
		builder.append(", spendMoney=");
		builder.append(spendMoney);
		builder.append("]");
		return builder.toString();
	}
}
