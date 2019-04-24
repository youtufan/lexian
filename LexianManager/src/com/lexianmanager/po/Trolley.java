package com.lexianmanager.po;

import java.math.BigDecimal;

public class Trolley {
	private int t_id;
	private String u_id;
	private String com_no;
	private String sto_no;
	private int amount;
	private BigDecimal listprice;
	private BigDecimal totalprice;
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
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
	public BigDecimal getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(BigDecimal totalprice) {
		this.totalprice = totalprice;
	}
}
