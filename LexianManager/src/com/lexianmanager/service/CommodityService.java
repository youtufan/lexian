package com.lexianmanager.service;
import java.util.List;

import com.lexianmanager.po.*;

public interface CommodityService {
	CommodityInfoVo selectById(String com_no);
	List<Commodity_store> selectAllComByNo(String com_no);
	StoreManagerVo selectByNo(String sto_no);
}
