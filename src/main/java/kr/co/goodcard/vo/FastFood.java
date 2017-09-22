package kr.co.goodcard.vo;

public class FastFood {

	private int fastFoodNo;
	private int fastFoodAmount;
	private int mcDonalds;
	private int lotteRia;
	private int burgurKing;
	private int kfc;
	private int mrPizza;
	private int dominoPizza;
	private int pizzaHut;
	private int papaJohns;
	private int fastFoodEtc;
	
	public FastFood() {
		
	}
	
	public FastFood(int fastFoodNo, int fastFoodAmount, int mcDonalds, int lotteRia, int burgurKing, int kfc,
			int mrPizza, int dominoPizza, int pizzaHut, int papaJohns, int fastFoodEtc) {
		this.fastFoodNo = fastFoodNo;
		this.fastFoodAmount = fastFoodAmount;
		this.mcDonalds = mcDonalds;
		this.lotteRia = lotteRia;
		this.burgurKing = burgurKing;
		this.kfc = kfc;
		this.mrPizza = mrPizza;
		this.dominoPizza = dominoPizza;
		this.pizzaHut = pizzaHut;
		this.papaJohns = papaJohns;
		this.fastFoodEtc = fastFoodEtc;
	}

	public int getFastFoodNo() {
		return fastFoodNo;
	}

	public void setFastFoodNo(int fastFoodNo) {
		this.fastFoodNo = fastFoodNo;
	}

	public int getFastFoodAmount() {
		return fastFoodAmount;
	}

	public void setFastFoodAmount(int fastFoodAmount) {
		this.fastFoodAmount = fastFoodAmount;
	}

	public int getMcDonalds() {
		return mcDonalds;
	}

	public void setMcDonalds(int mcDonalds) {
		this.mcDonalds = mcDonalds;
	}

	public int getLotteRia() {
		return lotteRia;
	}

	public void setLotteRia(int lotteRia) {
		this.lotteRia = lotteRia;
	}

	public int getBurgurKing() {
		return burgurKing;
	}

	public void setBurgurKing(int burgurKing) {
		this.burgurKing = burgurKing;
	}

	public int getKfc() {
		return kfc;
	}

	public void setKfc(int kfc) {
		this.kfc = kfc;
	}

	public int getMrPizza() {
		return mrPizza;
	}

	public void setMrPizza(int mrPizza) {
		this.mrPizza = mrPizza;
	}

	public int getDominoPizza() {
		return dominoPizza;
	}

	public void setDominoPizza(int dominoPizza) {
		this.dominoPizza = dominoPizza;
	}

	public int getPizzaHut() {
		return pizzaHut;
	}

	public void setPizzaHut(int pizzaHut) {
		this.pizzaHut = pizzaHut;
	}

	public int getPapaJohns() {
		return papaJohns;
	}

	public void setPapaJohns(int papaJohns) {
		this.papaJohns = papaJohns;
	}

	public int getFastFoodEtc() {
		return fastFoodEtc;
	}

	public void setFastFoodEtc(int fastFoodEtc) {
		this.fastFoodEtc = fastFoodEtc;
	}

	@Override
	public String toString() {
		return "FastFood [fastFoodNo=" + fastFoodNo + ", fastFoodAmount=" + fastFoodAmount + ", mcDonalds=" + mcDonalds
				+ ", lotteRia=" + lotteRia + ", burgurKing=" + burgurKing + ", kfc=" + kfc + ", mrPizza=" + mrPizza
				+ ", dominoPizza=" + dominoPizza + ", pizzaHut=" + pizzaHut + ", papaJohns=" + papaJohns
				+ ", fastFoodEtc=" + fastFoodEtc + "]";
	}	
}
