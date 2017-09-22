package kr.co.goodcard.vo;

public class Bookstore {
	
	private int bookstoreNo;
	private int bookstoreAmount;
	
	public Bookstore() {
		
	}
		
	public Bookstore(int bookstoreNo, int bookstoreAmount) {
		this.bookstoreNo = bookstoreNo;
		this.bookstoreAmount = bookstoreAmount;
	}
	
	public int getBookstoreNo() {
		return bookstoreNo;
	}
	
	public void setBookstoreNo(int bookstoreNo) {
		this.bookstoreNo = bookstoreNo;
	}
	
	public int getBookstoreAmount() {
		return bookstoreAmount;
	}
	
	public void setBookstoreAmount(int bookstoreAmount) {
		this.bookstoreAmount = bookstoreAmount;
	}
	
	@Override
	public String toString() {
		return "Bookstore [bookstoreNo=" + bookstoreNo + ", bookstoreAmount=" + bookstoreAmount + "]";
	}

	
}
