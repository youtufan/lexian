package com.lexianmanager.po;

import java.math.BigDecimal;

public class Commodity_store {
	private int comsto_id;
	private String com_no;
	private String sto_no;
	private BigDecimal com_price;
	private int com_amount;
	private int com_lockamount;
	private int type;
	public int getComsto_id() {
		return comsto_id;
	}
	public void setComsto_id(int comsto_id) {
		this.comsto_id = comsto_id;
	}
	public String getCom_no() {
		return com_no;
	}
	public void setCom_no(String com_no) {
		this.com_no = com_no;
	}
	public String getSto_no() {
		return sto_no;
	}
	public void setSto_no(String sto_no) {
		this.sto_no = sto_no;
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
	public int getCom_lockamount() {
		return com_lockamount;
	}
	public void setCom_lockamount(int com_lockamount) {
		this.com_lockamount = com_lockamount;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
