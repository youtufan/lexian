package com.lexianmanager.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.lexianmanager.dao.CommodityDetailDao;
import com.lexianmanager.po.CommodityDetailShow;
import com.lexianmanager.po.CommodityDetailVo;

public class CommodityDetailServiceImpl implements CommodityDetailService{
	@Autowired
	private CommodityDetailDao commodityDetailDao;
	
	@Override
	public List<CommodityDetailShow> viewCommodityDetail(CommodityDetailVo commodityDetailVo) throws Exception{
		List<Map<String, Object>> mapList = commodityDetailDao.viewCommodityDetail(commodityDetailVo);
		List<CommodityDetailShow> commodityDetailShowList = new ArrayList<CommodityDetailShow>();
		for(Map<String, Object> map : mapList) {
			CommodityDetailShow commodityDetailShow = new CommodityDetailShow();
			commodityDetailShow.setCom_no((String) map.get("com_no"));
			commodityDetailShow.setCom_name((String) map.get("com_name"));
			commodityDetailShow.setIntroduce((String) map.get("introduce"));
			commodityDetailShow.setCom_price(((BigDecimal) map.get("com_price")).doubleValue());
			commodityDetailShow.setSto_name((String) map.get("sto_name"));
			commodityDetailShow.setSto_add((String) map.get("sto_add"));
			commodityDetailShowList.add(commodityDetailShow);
		}
		return commodityDetailShowList;
	}
}
