package com.lexianmanager.service;

import java.util.List;

import com.lexianmanager.dao.StoreDao;
import com.lexianmanager.po.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class StoreQueryServiceImpl implements StoreQueryService {
	
	@Autowired
	StoreDao storeDao;
	

	public List<Store> findAllStore(StoreManagerVo storeManagerVo) throws Exception{
		
		return storeDao.findStoreList(storeManagerVo);
	}

	@Override
	public void updateStore(StoreManagerVo storeManagerVo) {
		storeDao.updateStore(storeManagerVo);
		
	}

	@Override
	public void insertStore(StoreManagerVo storeManagerVo) {
		storeDao.insertStore(storeManagerVo);
		
	}

	@Override
	public List<Commodity_store> findStoreCommodity(Commodity_storeQueryVo commodity_storeQueryVo) {
		
		return storeDao.findStoreCommodity(commodity_storeQueryVo);
	}

	@Override
	public String findCommodityName(Commodity_storeQueryVo commodity_storeQueryVo) {

		return storeDao.findCommodityName(commodity_storeQueryVo);
	}

	@Override
	public String findIdByName(String sto_name) {
		return storeDao.findIdByName(sto_name);
	}

	@Override
	public void updateCommodity(Commodity_storeQueryVo commodity_storeQueryVo) {
		storeDao.updateCommodity(commodity_storeQueryVo);
		
	}

}
