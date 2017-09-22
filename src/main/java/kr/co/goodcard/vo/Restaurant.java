package kr.co.goodcard.vo;

public class Restaurant {
	
	private int restaurantNo;
	private int restaurantAmount;
	private int outback;
	private int vips;
	private int ashley;
	private int tgif;
	private int madForGarlic;
	private int restaurantEtc;
	
	public Restaurant() {
		
	}	
	
	public Restaurant(int restaurantNo, int restaurantAmount, int outback, int vips, int ashley, int tgif,
			int madForGarlic, int restaurantEtc) {
		this.restaurantNo = restaurantNo;
		this.restaurantAmount = restaurantAmount;
		this.outback = outback;
		this.vips = vips;
		this.ashley = ashley;
		this.tgif = tgif;
		this.madForGarlic = madForGarlic;
		this.restaurantEtc = restaurantEtc;
	}

	public int getRestaurantNo() {
		return restaurantNo;
	}

	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}

	public int getRestaurantAmount() {
		return restaurantAmount;
	}

	public void setRestaurantAmount(int restaurantAmount) {
		this.restaurantAmount = restaurantAmount;
	}

	public int getOutback() {
		return outback;
	}

	public void setOutback(int outback) {
		this.outback = outback;
	}

	public int getVips() {
		return vips;
	}

	public void setVips(int vips) {
		this.vips = vips;
	}

	public int getAshley() {
		return ashley;
	}

	public void setAshley(int ashley) {
		this.ashley = ashley;
	}

	public int getTgif() {
		return tgif;
	}

	public void setTgif(int tgif) {
		this.tgif = tgif;
	}

	public int getMadForGarlic() {
		return madForGarlic;
	}

	public void setMadForGarlic(int madForGarlic) {
		this.madForGarlic = madForGarlic;
	}

	public int getRestaurantEtc() {
		return restaurantEtc;
	}

	public void setRestaurantEtc(int restaurantEtc) {
		this.restaurantEtc = restaurantEtc;
	}

	@Override
	public String toString() {
		return "Restaurant [restaurantNo=" + restaurantNo + ", restaurantAmount=" + restaurantAmount + ", outback="
				+ outback + ", vips=" + vips + ", ashley=" + ashley + ", tgif=" + tgif + ", madForGarlic="
				+ madForGarlic + ", restaurantEtc=" + restaurantEtc + "]";
	}
	
}
