package kr.co.goodcard.vo;

public class Communication {
	
	private int communicationNo;
	private int communicationAmount;
	private int communicationSkt;
	private int communicationKt;
	private int communicationUPlus;
	private int communicationEtc;
	
	public Communication() {

	}
	
	public Communication(int communicationNo, int communicationAmount, int communicationSkt, int communicationKt,
			int communicationUPlus, int communicationEtc) {
		this.communicationNo = communicationNo;
		this.communicationAmount = communicationAmount;
		this.communicationSkt = communicationSkt;
		this.communicationKt = communicationKt;
		this.communicationUPlus = communicationUPlus;
		this.communicationEtc = communicationEtc;
	}

	public int getCommunicationNo() {
		return communicationNo;
	}

	public void setCommunicationNo(int communicationNo) {
		this.communicationNo = communicationNo;
	}

	public int getCommunicationAmount() {
		return communicationAmount;
	}

	public void setCommunicationAmount(int communicationAmount) {
		this.communicationAmount = communicationAmount;
	}

	public int getCommunicationSkt() {
		return communicationSkt;
	}

	public void setCommunicationSkt(int communicationSkt) {
		this.communicationSkt = communicationSkt;
	}

	public int getCommunicationKt() {
		return communicationKt;
	}

	public void setCommunicationKt(int communicationKt) {
		this.communicationKt = communicationKt;
	}

	public int getCommunicationUPlus() {
		return communicationUPlus;
	}

	public void setCommunicationUPlus(int communicationUPlus) {
		this.communicationUPlus = communicationUPlus;
	}

	public int getCommunicationEtc() {
		return communicationEtc;
	}

	public void setCommunicationEtc(int communicationEtc) {
		this.communicationEtc = communicationEtc;
	}

	@Override
	public String toString() {
		return "Communication [communicationNo=" + communicationNo + ", communicationAmount=" + communicationAmount
				+ ", communicationSkt=" + communicationSkt + ", communicationKt=" + communicationKt
				+ ", communicationUPlus=" + communicationUPlus + ", communicationEtc=" + communicationEtc + "]";
	}
}
