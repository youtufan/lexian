package com.lexianmanager.dao;

import java.util.List;

import com.lexianmanager.po.Commodity;
import com.lexianmanager.po.Commodity_store;
import com.lexianmanager.po.Store;

public interface CommodityDao {
	List<Commodity> findAllCommodity();
	Commodity findCommodityByNo(String com_no);
	void insertCommodity(Commodity commodity);
	void deleteCommodity(String com_no);
	String selectCommodityId(String com_no);
	void updateCommodity(Commodity commodity);
	Commodity selectById(String com_no);
	List<Commodity_store> selectByCom_no(String com_no);
	Store selectStoByNo(String sto_no);
}
