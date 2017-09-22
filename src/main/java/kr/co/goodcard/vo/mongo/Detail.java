package kr.co.goodcard.vo.mongo;

import java.util.List;

public class Detail {
	
	private String detailCategory;
	private List<ServiceList> serviceList;
	
	public Detail() {
	}
	
	public Detail(String detailCategory, List<ServiceList> serviceList) {
		this.detailCategory = detailCategory;
		this.serviceList = serviceList;
	}
	
	public String getDetailCategory() {
		return detailCategory;
	}
	
	public void setDetailCategory(String detailCategory) {
		this.detailCategory = detailCategory;
	}
	
	public List<ServiceList> getServiceList() {
		return serviceList;
	}
	
	public void setServiceList(List<ServiceList> serviceList) {
		this.serviceList = serviceList;
	}
	
	@Override
	public String toString() {
		return "Detail [detailCategory=" + detailCategory + ", serviceList=" + serviceList + "]";
	}	
}
