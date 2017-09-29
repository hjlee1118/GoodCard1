package kr.co.goodcard.vo.mongo;

public class BrandList {
	
	private String brand;
	private String benefit;
	private int benefitType;
	private String constraint;
	private double benefitPerLiter;
	private double benefitAmount;
	private double benefitPercent;
	private double benefitMileagePerSpend;
	private int prevPerformance;
	private int lastMonthDemand;
	private int lastYearDemand;
	private int thisMonthMaxCount;
	private int thisMonthMaxBenefitRatio;
	private int thisMonthMaxBenefit;
	private int todayMaxCount;
	private int todayMaxBenefit;
	private int thisYearMaxCount;
	private int thisYearMaxBenefit;
	private int minimumDemand;
	private int atPaymentMaxCount;
	private int atPaymentMaxBenefit;
	private int atPaymentMaxMoneyApplication;
	
	public BrandList() {
		super();
	}

	public BrandList(String brand, String benefit, int benefitType, String constraint, double benefitPerLiter,
			double benefitAmount, double benefitPercent, double benefitMileagePerSpend, int prevPerformance,
			int lastMonthDemand, int lastYearDemand, int thisMonthMaxCount, int thisMonthMaxBenefitRatio,
			int thisMonthMaxBenefit, int todayMaxCount, int todayMaxBenefit, int thisYearMaxCount,
			int thisYearMaxBenefit, int minimumDemand, int atPaymentMaxCount, int atPaymentMaxBenefit,
			int atPaymentMaxMoneyApplication) {
		super();
		this.brand = brand;
		this.benefit = benefit;
		this.benefitType = benefitType;
		this.constraint = constraint;
		this.benefitPerLiter = benefitPerLiter;
		this.benefitAmount = benefitAmount;
		this.benefitPercent = benefitPercent;
		this.benefitMileagePerSpend = benefitMileagePerSpend;
		this.prevPerformance = prevPerformance;
		this.lastMonthDemand = lastMonthDemand;
		this.lastYearDemand = lastYearDemand;
		this.thisMonthMaxCount = thisMonthMaxCount;
		this.thisMonthMaxBenefitRatio = thisMonthMaxBenefitRatio;
		this.thisMonthMaxBenefit = thisMonthMaxBenefit;
		this.todayMaxCount = todayMaxCount;
		this.todayMaxBenefit = todayMaxBenefit;
		this.thisYearMaxCount = thisYearMaxCount;
		this.thisYearMaxBenefit = thisYearMaxBenefit;
		this.minimumDemand = minimumDemand;
		this.atPaymentMaxCount = atPaymentMaxCount;
		this.atPaymentMaxBenefit = atPaymentMaxBenefit;
		this.atPaymentMaxMoneyApplication = atPaymentMaxMoneyApplication;
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

	public int getBenefitType() {
		return benefitType;
	}

	public void setBenefitType(int benefitType) {
		this.benefitType = benefitType;
	}

	public String getConstraint() {
		return constraint;
	}

	public void setConstraint(String constraint) {
		this.constraint = constraint;
	}

	public double getBenefitPerLiter() {
		return benefitPerLiter;
	}

	public void setBenefitPerLiter(double benefitPerLiter) {
		this.benefitPerLiter = benefitPerLiter;
	}

	public double getBenefitAmount() {
		return benefitAmount;
	}

	public void setBenefitAmount(double benefitAmount) {
		this.benefitAmount = benefitAmount;
	}

	public double getBenefitPercent() {
		return benefitPercent;
	}

	public void setBenefitPercent(double benefitPercent) {
		this.benefitPercent = benefitPercent;
	}

	public double getBenefitMileagePerSpend() {
		return benefitMileagePerSpend;
	}

	public void setBenefitMileagePerSpend(double benefitMileagePerSpend) {
		this.benefitMileagePerSpend = benefitMileagePerSpend;
	}

	public int getPrevPerformance() {
		return prevPerformance;
	}

	public void setPrevPerformance(int prevPerformance) {
		this.prevPerformance = prevPerformance;
	}

	public int getLastMonthDemand() {
		return lastMonthDemand;
	}

	public void setLastMonthDemand(int lastMonthDemand) {
		this.lastMonthDemand = lastMonthDemand;
	}

	public int getLastYearDemand() {
		return lastYearDemand;
	}

	public void setLastYearDemand(int lastYearDemand) {
		this.lastYearDemand = lastYearDemand;
	}

	public int getThisMonthMaxCount() {
		return thisMonthMaxCount;
	}

	public void setThisMonthMaxCount(int thisMonthMaxCount) {
		this.thisMonthMaxCount = thisMonthMaxCount;
	}

	public int getThisMonthMaxBenefitRatio() {
		return thisMonthMaxBenefitRatio;
	}

	public void setThisMonthMaxBenefitRatio(int thisMonthMaxBenefitRatio) {
		this.thisMonthMaxBenefitRatio = thisMonthMaxBenefitRatio;
	}

	public int getThisMonthMaxBenefit() {
		return thisMonthMaxBenefit;
	}

	public void setThisMonthMaxBenefit(int thisMonthMaxBenefit) {
		this.thisMonthMaxBenefit = thisMonthMaxBenefit;
	}

	public int getTodayMaxCount() {
		return todayMaxCount;
	}

	public void setTodayMaxCount(int todayMaxCount) {
		this.todayMaxCount = todayMaxCount;
	}

	public int getTodayMaxBenefit() {
		return todayMaxBenefit;
	}

	public void setTodayMaxBenefit(int todayMaxBenefit) {
		this.todayMaxBenefit = todayMaxBenefit;
	}

	public int getThisYearMaxCount() {
		return thisYearMaxCount;
	}

	public void setThisYearMaxCount(int thisYearMaxCount) {
		this.thisYearMaxCount = thisYearMaxCount;
	}

	public int getThisYearMaxBenefit() {
		return thisYearMaxBenefit;
	}

	public void setThisYearMaxBenefit(int thisYearMaxBenefit) {
		this.thisYearMaxBenefit = thisYearMaxBenefit;
	}

	public int getMinimumDemand() {
		return minimumDemand;
	}

	public void setMinimumDemand(int minimumDemand) {
		this.minimumDemand = minimumDemand;
	}

	public int getAtPaymentMaxCount() {
		return atPaymentMaxCount;
	}

	public void setAtPaymentMaxCount(int atPaymentMaxCount) {
		this.atPaymentMaxCount = atPaymentMaxCount;
	}

	public int getAtPaymentMaxBenefit() {
		return atPaymentMaxBenefit;
	}

	public void setAtPaymentMaxBenefit(int atPaymentMaxBenefit) {
		this.atPaymentMaxBenefit = atPaymentMaxBenefit;
	}

	public int getAtPaymentMaxMoneyApplication() {
		return atPaymentMaxMoneyApplication;
	}

	public void setAtPaymentMaxMoneyApplication(int atPaymentMaxMoneyApplication) {
		this.atPaymentMaxMoneyApplication = atPaymentMaxMoneyApplication;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BrandList [brand=");
		builder.append(brand);
		builder.append(", benefit=");
		builder.append(benefit);
		builder.append(", benefitType=");
		builder.append(benefitType);
		builder.append(", constraint=");
		builder.append(constraint);
		builder.append(", benefitPerLiter=");
		builder.append(benefitPerLiter);
		builder.append(", benefitAmount=");
		builder.append(benefitAmount);
		builder.append(", benefitPercent=");
		builder.append(benefitPercent);
		builder.append(", benefitMileagePerSpend=");
		builder.append(benefitMileagePerSpend);
		builder.append(", prevPerformance=");
		builder.append(prevPerformance);
		builder.append(", lastMonthDemand=");
		builder.append(lastMonthDemand);
		builder.append(", lastYearDemand=");
		builder.append(lastYearDemand);
		builder.append(", thisMonthMaxCount=");
		builder.append(thisMonthMaxCount);
		builder.append(", thisMonthMaxBenefitRatio=");
		builder.append(thisMonthMaxBenefitRatio);
		builder.append(", thisMonthMaxBenefit=");
		builder.append(thisMonthMaxBenefit);
		builder.append(", todayMaxCount=");
		builder.append(todayMaxCount);
		builder.append(", todayMaxBenefit=");
		builder.append(todayMaxBenefit);
		builder.append(", thisYearMaxCount=");
		builder.append(thisYearMaxCount);
		builder.append(", thisYearMaxBenefit=");
		builder.append(thisYearMaxBenefit);
		builder.append(", minimumDemand=");
		builder.append(minimumDemand);
		builder.append(", atPaymentMaxCount=");
		builder.append(atPaymentMaxCount);
		builder.append(", atPaymentMaxBenefit=");
		builder.append(atPaymentMaxBenefit);
		builder.append(", atPaymentMaxMoneyApplication=");
		builder.append(atPaymentMaxMoneyApplication);
		builder.append("]");
		return builder.toString();
	}	
}
