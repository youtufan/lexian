package com.lexianmanager.po;

import java.math.BigDecimal;

public class OrderitemVo {
	private String com_no;
	private int amount;
	private BigDecimal listprice;
	private BigDecimal oi_totalprice;
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
