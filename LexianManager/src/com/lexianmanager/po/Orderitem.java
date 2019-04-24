package com.lexianmanager.po;

import java.math.BigDecimal;

public class Orderitem {
	private int oi_id;
	private int o_id;
	private String com_no;
	private int amount;
	private BigDecimal listprice;
	private BigDecimal oi_totalprice;
	public int getOi_id() {
		return oi_id;
	}
	public void setOi_id(int oi_id) {
		this.oi_id = oi_id;
	}
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public String getCom_no() {
		return com_no;
	}
	public void setCom_no(String com_no) {
		this.com_no = com_no;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public BigDecimal getListprice() {
		return listprice;
	}
	public void setListprice(BigDecimal listprice) {
		this.listprice = listprice;
	}
	public BigDecimal getOi_totalprice() {
		return oi_totalprice;
	}
	public void setOi_totalprice(BigDecimal oi_totalprice) {
		this.oi_totalprice = oi_totalprice;
	}
}
