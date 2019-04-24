package com.lexianmanager.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.lexianmanager.dao.CHCommodityDao;
import com.lexianmanager.po.CommodityShow;
import com.lexianmanager.po.CommodityVo;

public class CHCommodityServiceImpl implements CHCommodityService{
	
	@Autowired
	private CHCommodityDao cHCommodityDao;

	@Override
	public List<CommodityShow> findCommodityByName(CommodityVo commodityVo) throws Exception {
		List<Map<String, Object>> mapList = cHCommodityDao.findCommodityByName(commodityVo);
		Map<String, String> com_name = new HashMap<String, String>();
		Map<String, String> introduce = new HashMap<String, String>();
		Map<String, Double> min_price = new HashMap<String, Double>();
		Map<String, Double> max_price = new HashMap<String, Double>();
		Map<String, String> pictureurl = new HashMap<String, String>();
		
		for(Map<String, Object> map : mapList) {
			com_name.put((String) map.get("com_no"), (String) map.get("com_name"));
			introduce.put((String) map.get("com_no"), (String) map.get("introduce"));
			pictureurl.put((String) map.get("com_no"), (String) map.get("pictureurl"));

			if(min_price.get((String) map.get("com_no")) != null) {
				double price = min_price.get(map.get("com_no")).doubleValue();
				min_price.put((String) map.get("com_no"),
						price < ((BigDecimal)map.get("com_price")).doubleValue() ? 
								price : ((BigDecimal) map.get("com_price")).doubleValue());
			} else {
				min_price.put((String) map.get("com_no"), ((BigDecimal)map.get("com_price")).doubleValue());
			}
			
			if(max_price.get((String) map.get("com_no")) != null) {
				double price = max_price.get(map.get("com_no")).doubleValue();
				max_price.put((String) map.get("com_no"),
						price > ((BigDecimal)map.get("com_price")).doubleValue() ? 
								price : ((BigDecimal) map.get("com_price")).doubleValue());
			} else {
				max_price.put((String) map.get("com_no"), ((BigDecimal)map.get("com_price")).doubleValue());
			}
		}
		Set<String> com_noSet = com_name.keySet();
		List<CommodityShow> commodityShowList = new ArrayList<CommodityShow>();
		for(String key : com_noSet) {
			CommodityShow commodityShow = new CommodityShow();
			commodityShow.setCom_no(key);
			commodityShow.setCom_name(com_name.get(key));
			commodityShow.setIntroduce(introduce.get(key));
			commodityShow.setPictureurl(pictureurl.get(key));
			commodityShow.setMin_price(min_price.get(key));
			commodityShow.setMax_price(max_price.get(key));
			commodityShowList.add(commodityShow);
		}
		return commodityShowList;
	}
	
}
