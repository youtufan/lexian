package com.lexianmanager.service;

import java.util.List;

import com.lexianmanager.po.CommodityDetailShow;
import com.lexianmanager.po.CommodityDetailVo;

public interface CommodityDetailService {
	public List<CommodityDetailShow> viewCommodityDetail(CommodityDetailVo commodityDetailVo) throws Exception;
}
