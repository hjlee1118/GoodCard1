package kr.co.goodcard.vo.mongo;

import java.util.List;

public class SpecialService {
	
	private String category;
	private List<Detail> detail;
	
	public SpecialService() {

	}

	public SpecialService(String category, List<Detail> detail) {
		this.category = category;
		this.detail = detail;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public List<Detail> getDetail() {
		return detail;
	}

	public void setDetail(List<Detail> detail) {
		this.detail = detail;
	}

	@Override
	public String toString() {
		return "SpecialService [category=" + category + ", detail=" + detail + "]";
	}	
}
