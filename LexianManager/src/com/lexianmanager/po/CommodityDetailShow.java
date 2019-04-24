package com.lexianmanager.po;

public class CommodityDetailShow {
	private String com_no;
	private String com_name;
	private String introduce;
	private double com_price;
	private String sto_name;
	private String sto_add;
	
	public String getCom_no() {
		return com_no;
	}
	public void setCom_no(String com_no) {
		this.com_no = com_no;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public double getCom_price() {
		return com_price;
	}
	public void setCom_price(double com_price) {
		this.com_price = com_price;
	}
	public String getSto_name() {
		return sto_name;
	}
	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}
	public String getSto_add() {
		return sto_add;
	}
	public void setSto_add(String sto_add) {
		this.sto_add = sto_add;
	}
	@Override
	public String toString() {
		return "CommodityDetailShow [com_no=" + com_no + ", com_name=" + com_name + ", introduce=" + introduce
				+ ", com_price=" + com_price + ", sto_name=" + sto_name + ", sto_add=" + sto_add + "]";
	}
	
	
	
}
