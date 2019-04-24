package com.lexianmanager.po;

import java.math.BigDecimal;

public class OrdersUserComListVo {
	private int amount;
	private BigDecimal listprice;
	private BigDecimal oi_totalprice;
	private String com_name;
	private String pictureurl;
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
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getPictureurl() {
		return pictureurl;
	}
	public void setPictureurl(String pictureurl) {
		this.pictureurl = pictureurl;
	}
	
}
