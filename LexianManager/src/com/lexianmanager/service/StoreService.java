package com.lexianmanager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lexianmanager.po.Commodity;
import com.lexianmanager.po.Orderitem;
import com.lexianmanager.po.Orders;
import com.lexianmanager.po.Store;
import com.lexianmanager.po.Trolley;


@Service
public interface StoreService {
	List<Trolley> findAllTrolley(String u_id);
	Commodity findCommodityByNo(String com_no);
	Store findStoreById(int sto_no);
	void insertOrder(Orders order);
	int findOid(String o_no);
	void insertOrderItem(Orderitem orderitem);
	void updateAmount(Trolley trolley);
	void insertTrolley(Trolley trolley);
	void deleteTrolley(Trolley trolley);
}
