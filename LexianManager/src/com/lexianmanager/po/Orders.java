package com.lexianmanager.po;

import java.math.BigDecimal;

public class Orders {
	private int o_id;
	private String o_no;
	private int u_id;
	private String sto_no;
	private BigDecimal totalamount;
	private String paymenttype;
	private String deliverytype;
	private String o_states;
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public String getO_no() {
		return o_no;
	}
	public void setO_no(String o_no) {
		this.o_no = o_no;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getSto_no() {
		return sto_no;
	}
	public void setSto_no(String sto_no) {
		this.sto_no = sto_no;
	}
	public BigDecimal getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(BigDecimal totalamount) {
		this.totalamount = totalamount;
	}
	public String getPaymenttype() {
		return paymenttype;
	}
	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}
	public String getDeliverytype() {
		return deliverytype;
	}
	public void setDeliverytype(String deliverytype) {
		this.deliverytype = deliverytype;
	}
	public String getO_states() {
		return o_states;
	}
	public void setO_states(String o_states) {
		this.o_states = o_states;
	}

}
