package com.lexianmanager.dao;

import java.util.List;

import com.lexianmanager.po.*;

public interface StoreDao {
	List<Store> findAllStore();
	Store findStoreById(int sto_no);
	List<Store> findStoreList(StoreManagerVo stroeManagerVo) throws Exception;
	void updateStore(StoreManagerVo storeManagerVo);
	void insertStore(StoreManagerVo storeManagerVo);
	List<Commodity_store> findStoreCommodity(Commodity_storeQueryVo commodity_storeQueryVo);
	String findCommodityName(Commodity_storeQueryVo commodity_storeQueryVo);
	String findIdByName(String sto_name);
	void updateCommodity(Commodity_storeQueryVo commodity_storeQueryVo);
}
