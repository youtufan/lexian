package com.lexianmanager.po;

import java.util.List;

public class Commodity_storeDetailVo {
	private List<Commodity_store> commodity_storeList;
	private List<Store> stoList;
	private CommodityInfoVo commodityInfoVo;
	public CommodityInfoVo getCommodityInfoVo() {
		return commodityInfoVo;
	}
	public void setCommodityInfoVo(CommodityInfoVo commodityInfoVo) {
		this.commodityInfoVo = commodityInfoVo;
	}
	public List<Commodity_store> getCommodity_storeList() {
		return commodity_storeList;
	}
	public void setCommodity_storeList(List<Commodity_store> commodity_storeList) {
		this.commodity_storeList = commodity_storeList;
	}
	public List<Store> getStoList() {
		return stoList;
	}
	public void setStoList(List<Store> stoList) {
		this.stoList = stoList;
	}
}
