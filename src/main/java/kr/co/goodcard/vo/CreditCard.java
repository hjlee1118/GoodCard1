package kr.co.goodcard.vo;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import kr.co.goodcard.vo.mongo.AnnualFee;
import kr.co.goodcard.vo.mongo.Benefits;
import kr.co.goodcard.vo.mongo.LimitBenefit;
import kr.co.goodcard.vo.mongo.SpecialService;

@Document(collection="creditCard")
public class CreditCard implements Comparable<CreditCard>{
	
	@Id
	private String id;
	private int no;
	private String brand;
	private String cardType;
	private String cardName;
	private String annotation;
	private String imagePath;
	private List<AnnualFee> annualFee;
	private List<LimitBenefit> limitBenefit;
	private List<SpecialService> specialServices;
	private List<Benefits> benefits;
	private Estimate estimate; // 추가
	private int viewCount;
	private int totalBenefit; // 추가
	private String homepageURL;
	
	public CreditCard() {
		super();
	}

	public CreditCard(String id, int no, String brand, String cardType, String cardName, String annotation,
			String imagePath, List<AnnualFee> annualFee, List<LimitBenefit> limitBenefit,
			List<SpecialService> specialServices, List<Benefits> benefits, Estimate estimate, int viewCount,
			int totalBenefit, String homepageURL) {
		super();
		this.id = id;
		this.no = no;
		this.brand = brand;
		this.cardType = cardType;
		this.cardName = cardName;
		this.annotation = annotation;
		this.imagePath = imagePath;
		this.annualFee = annualFee;
		this.limitBenefit = limitBenefit;
		this.specialServices = specialServices;
		this.benefits = benefits;
		this.estimate = estimate;
		this.viewCount = viewCount;
		this.totalBenefit = totalBenefit;
		this.homepageURL = homepageURL;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getAnnotation() {
		return annotation;
	}

	public void setAnnotation(String annotation) {
		this.annotation = annotation;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public List<AnnualFee> getAnnualFee() {
		return annualFee;
	}

	public void setAnnualFee(List<AnnualFee> annualFee) {
		this.annualFee = annualFee;
	}

	public List<LimitBenefit> getLimitBenefit() {
		return limitBenefit;
	}

	public void setLimitBenefit(List<LimitBenefit> limitBenefit) {
		this.limitBenefit = limitBenefit;
	}

	public List<SpecialService> getSpecialServices() {
		return specialServices;
	}

	public void setSpecialServices(List<SpecialService> specialServices) {
		this.specialServices = specialServices;
	}

	public List<Benefits> getBenefits() {
		return benefits;
	}

	public void setBenefits(List<Benefits> benefits) {
		this.benefits = benefits;
	}

	public Estimate getEstimate() {
		return estimate;
	}

	public void setEstimate(Estimate estimate) {
		this.estimate = estimate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getTotalBenefit() {
		return totalBenefit;
	}

	public void setTotalBenefit(int totalBenefit) {
		this.totalBenefit = totalBenefit;
	}

	public String getHomepageURL() {
		return homepageURL;
	}

	public void setHomepageURL(String homepageURL) {
		this.homepageURL = homepageURL;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CreditCard [id=");
		builder.append(id);
		builder.append(", no=");
		builder.append(no);
		builder.append(", brand=");
		builder.append(brand);
		builder.append(", cardType=");
		builder.append(cardType);
		builder.append(", cardName=");
		builder.append(cardName);
		builder.append(", annotation=");
		builder.append(annotation);
		builder.append(", imagePath=");
		builder.append(imagePath);
		builder.append(", annualFee=");
		builder.append(annualFee);
		builder.append(", limitBenefit=");
		builder.append(limitBenefit);
		builder.append(", specialServices=");
		builder.append(specialServices);
		builder.append(", benefits=");
		builder.append(benefits);
		builder.append(", estimate=");
		builder.append(estimate);
		builder.append(", viewCount=");
		builder.append(viewCount);
		builder.append(", homepageURL=");
		builder.append(homepageURL);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int compareTo(CreditCard o) {
		if(this.totalBenefit < o.totalBenefit) {
			return 1;
		} else if(this.totalBenefit > o.totalBenefit) {
			return -1;
		} else {
			return 0;
		}
	}
}
