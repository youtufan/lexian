package com.lexianmanager.dao;

import java.util.List;
import java.util.Map;

import com.lexianmanager.po.CommodityVo;

public interface CHCommodityDao {
	public List<Map<String, Object>> findCommodityByName(CommodityVo commodityVo) throws Exception;
}
