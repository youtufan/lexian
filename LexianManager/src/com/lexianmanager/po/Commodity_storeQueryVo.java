package com.lexianmanager.po;

import java.math.BigDecimal;

public class Commodity_storeQueryVo {
	private String sto_no;
	private String com_no;
	private String com_name;
	private BigDecimal com_price;
	private int com_amount;
	private int type;
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getSto_no() {
		return sto_no;
	}
	public void setSto_no(String sto_no) {
		this.sto_no = sto_no;
	}
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
	public BigDecimal getCom_price() {
		return com_price;
	}
	public void setCom_price(BigDecimal com_price) {
		this.com_price = com_price;
	}
	public int getCom_amount() {
		return com_amount;
	}
	public void setCom_amount(int com_amount) {
		this.com_amount = com_amount;
	}
}
