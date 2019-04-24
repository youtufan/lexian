package com.lexianmanager.po;

import java.util.ArrayList;
import java.util.List;

public class OrdersUserVo {
	private String sto_name;
	private String sto_add;
	private List<OrdersUserComListVo> ordersUserComListVo=new ArrayList<OrdersUserComListVo>();
	public String getSto_name() {
		return sto_name;
	}
	public List<OrdersUserComListVo> getOrdersUserComListVo() {
		return ordersUserComListVo;
	}
	public void setOrdersUserComListVo(List<OrdersUserComListVo> ordersUserComListVo) {
		this.ordersUserComListVo = ordersUserComListVo;
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

	
}
