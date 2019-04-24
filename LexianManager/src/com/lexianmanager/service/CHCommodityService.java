package com.lexianmanager.service;

import java.util.List;

import com.lexianmanager.po.CommodityShow;
import com.lexianmanager.po.CommodityVo;

public interface CHCommodityService {
	public List<CommodityShow> findCommodityByName(CommodityVo commodityVo) throws Exception;
}
