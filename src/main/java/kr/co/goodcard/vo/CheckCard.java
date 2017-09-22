package kr.co.goodcard.vo;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import kr.co.goodcard.vo.mongo.*;

@Document(collection="checkCard")
public class CheckCard {
	
	
	@Id
	private String id;
	private String brand;
	private String cardType;
	private String cardName;
	private String annotation;
	private String imagePath;
	private List<AnnualFee> annualFee;
	private List<LimitBenefit> limitBenefit;
	private List<SpecialService> specialServices;
	private List<Benefits> benefits;
	private int viewCount;
	private String homepageURL;
	
	public CheckCard() {
	}

	public CheckCard(String id, String brand, String cardType, String cardName, String annotation, String imagePath,
			List<AnnualFee> annualFee, List<LimitBenefit> limitBenefit, List<SpecialService> specialServices,
			List<Benefits> benefits, int viewCount, String homepageURL) {
		this.id = id;
		this.brand = brand;
		this.cardType = cardType;
		this.cardName = cardName;
		this.annotation = annotation;
		this.imagePath = imagePath;
		this.annualFee = annualFee;
		this.limitBenefit = limitBenefit;
		this.specialServices = specialServices;
		this.benefits = benefits;
		this.viewCount = viewCount;
		this.homepageURL = homepageURL;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
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
	
	public int getViewCount() {
		return viewCount;
	}
	
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	public String getHomepageURL() {
		return homepageURL;
	}
	
	public void setHomepageURL(String homepageURL) {
		this.homepageURL = homepageURL;
	}
	
	@Override
	public String toString() {
		return "CheckCard [id=" + id + ", brand=" + brand + ", cardType=" + cardType + ", cardName=" + cardName
				+ ", annotation=" + annotation + ", imagePath=" + imagePath + ", annualFee=" + annualFee
				+ ", limitBenefit=" + limitBenefit + ", specialServices=" + specialServices + ", benefits=" + benefits
				+ ", viewCount=" + viewCount + ", homepageURL=" + homepageURL + "]";
	}
	
}
