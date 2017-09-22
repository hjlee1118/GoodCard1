package kr.co.goodcard.vo;

public class Poll {

	private int no;
	private int memberNo;
	private int amount; // 월간 총 지출액
	private int age;
	private String cardtype;
	
	public Poll() {
	}
	
	public Poll(int no, int memberNo, int amount, int age, String cardtype) {
		this.no = no;
		this.memberNo = memberNo;
		this.amount = amount;
		this.age = age;
		this.cardtype = cardtype;
	}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	public int getAmount() {
		return amount;
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getCardtype() {
		return cardtype;
	}
	
	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}
	
	@Override
	public String toString() {
		return "Poll [no=" + no + ", memberNo=" + memberNo + ", amount=" + amount + ", age=" + age + ", cardtype="
				+ cardtype + "]";
	}
	
}
