package kr.co.goodcard.vo;

import java.sql.Date;

public class Member {
	
	private int no;
	private String id;
	private String password;
	private String name;
	private String gender;
	private String email;
	private String emailId;
	private String emailDomain;
	private String phone;
	private String phone1;
	private String phone2;
	private String phone3;
	private int tendency;
	private int pollNo;
	private String type;
	private String inputBirthDate;
	private Date birthDate;
	private String card1;
	private String card2;
	private String card3;
	
	public Member() {

	}

	public Member(int no, String id, String password, String name, String gender, String email, String emailId,
			String emailDomain, String phone, String phone1, String phone2, String phone3, int tendency, int pollNo,
			String type, String inputBirthDate, Date birthDate, String card1, String card2, String card3) {
		this.no = no;
		this.id = id;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.email = email;
		this.emailId = emailId;
		this.emailDomain = emailDomain;
		this.phone = phone;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.tendency = tendency;
		this.pollNo = pollNo;
		this.type = type;
		this.inputBirthDate = inputBirthDate;
		this.birthDate = birthDate;
		this.card1 = card1;
		this.card2 = card2;
		this.card3 = card3;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getEmailDomain() {
		return emailDomain;
	}

	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public int getTendency() {
		return tendency;
	}

	public void setTendency(int tendency) {
		this.tendency = tendency;
	}

	public int getPollNo() {
		return pollNo;
	}

	public void setPollNo(int pollNo) {
		this.pollNo = pollNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getInputBirthDate() {
		return inputBirthDate;
	}

	public void setInputBirthDate(String inputBirthDate) {
		this.inputBirthDate = inputBirthDate;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getCard1() {
		return card1;
	}

	public void setCard1(String card1) {
		this.card1 = card1;
	}

	public String getCard2() {
		return card2;
	}

	public void setCard2(String card2) {
		this.card2 = card2;
	}

	public String getCard3() {
		return card3;
	}

	public void setCard3(String card3) {
		this.card3 = card3;
	}

	@Override
	public String toString() {
		return "Member [no=" + no + ", id=" + id + ", password=" + password + ", name=" + name + ", gender=" + gender
				+ ", email=" + email + ", emailId=" + emailId + ", emailDomain=" + emailDomain + ", phone=" + phone
				+ ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", tendency=" + tendency
				+ ", pollNo=" + pollNo + ", type=" + type + ", inputBirthDate=" + inputBirthDate + ", birthDate="
				+ birthDate + ", card1=" + card1 + ", card2=" + card2 + ", card3=" + card3 + "]";
	}
	
}
