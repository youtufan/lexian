package com.lexianmanager.dao;

import java.util.List;
import java.util.Map;

import com.lexianmanager.po.CommodityDetailVo;

public interface CommodityDetailDao {
	public List<Map<String, Object>> viewCommodityDetail(CommodityDetailVo commodityDetailVo) throws Exception;
}
