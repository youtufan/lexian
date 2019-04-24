package com.lexianmanager.service;

import java.util.List;

import com.lexianmanager.po.Commodity_store;
import com.lexianmanager.po.Commodity_storeQueryVo;
import com.lexianmanager.po.Store;
import com.lexianmanager.po.StoreManagerVo;

public interface StoreQueryService {
		public List<Store> findAllStore(StoreManagerVo storeManagerVo) throws Exception;
		public void updateStore(StoreManagerVo storeManagerVo);
		public void insertStore(StoreManagerVo storeManagerVo);
		public List<Commodity_store> findStoreCommodity(Commodity_storeQueryVo commodity_storeQueryVo);
		public String findCommodityName(Commodity_storeQueryVo commodity_storeQueryVo);
		public String findIdByName(String sto_name);
		public void updateCommodity(Commodity_storeQueryVo commodity_storeQueryVo);
}
