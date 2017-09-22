package kr.co.goodcard.vo.mongo;

import java.util.List;

public class Benefits {
	
	private String category;
	private List<BrandList> brandList;
	
	public Benefits() {
		
	}
	
	public Benefits(String category, List<BrandList> brandList) {
		this.category = category;
		this.brandList = brandList;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public List<BrandList> getBrandList() {
		return brandList;
	}
	
	public void setBrandList(List<BrandList> brandList) {
		this.brandList = brandList;
	}
	
	@Override
	public String toString() {
		return "Benefits [category=" + category + ", brandList=" + brandList + "]";
	}
}
