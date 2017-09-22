package kr.co.goodcard.vo.mongo;

public class ServiceList {
	
	private String service;
	private String content;
	
	public ServiceList() {
	
	}

	public ServiceList(String service, String content) {
		this.service = service;
		this.content = content;
	}
	
	public String getService() {
		return service;
	}
	
	public void setService(String service) {
		this.service = service;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "ServiceList [service=" + service + ", content=" + content + "]";
	}
}
