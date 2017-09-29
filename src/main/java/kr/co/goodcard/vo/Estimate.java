package kr.co.goodcard.vo;

import java.util.ArrayList;

public class Estimate {
	int total;
	int limitBenefit;
	ArrayList<Benefit> benefitList;
	ArrayList<NonBenefit> noneBenefitList;
	
	public Estimate() {
		super();
	}

	public Estimate(int total, int limitBenefit, ArrayList<Benefit> benefitList,
			ArrayList<NonBenefit> noneBenefitList) {
		super();
		this.total = total;
		this.limitBenefit = limitBenefit;
		this.benefitList = benefitList;
		this.noneBenefitList = noneBenefitList;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getLimitBenefit() {
		return limitBenefit;
	}

	public void setLimitBenefit(int limitBenefit) {
		this.limitBenefit = limitBenefit;
	}

	public ArrayList<Benefit> getBenefitList() {
		return benefitList;
	}

	public void setBenefitList(ArrayList<Benefit> benefitList) {
		this.benefitList = benefitList;
	}

	public ArrayList<NonBenefit> getNoneBenefitList() {
		return noneBenefitList;
	}

	public void setNoneBenefitList(ArrayList<NonBenefit> noneBenefitList) {
		this.noneBenefitList = noneBenefitList;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Estimate [total=");
		builder.append(total);
		builder.append(", limitBenefit=");
		builder.append(limitBenefit);
		builder.append(", benefitList=");
		builder.append(benefitList);
		builder.append(", noneBenefitList=");
		builder.append(noneBenefitList);
		builder.append("]");
		return builder.toString();
	}
}
