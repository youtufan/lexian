package com.lexianmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lexianmanager.dao.CommodityDao;
import com.lexianmanager.dao.OrderDao;
import com.lexianmanager.dao.StoreDao;
import com.lexianmanager.dao.TrolleyDao;
import com.lexianmanager.po.Commodity;
import com.lexianmanager.po.Orderitem;
import com.lexianmanager.po.Orders;
import com.lexianmanager.po.Store;
import com.lexianmanager.po.Trolley;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	TrolleyDao trolleyDao;

	@Autowired
	CommodityDao commodityDao;
	
	@Autowired
	StoreDao storeDao;
	
	@Autowired
	OrderDao orderDao;

	@Override
	public List<Trolley> findAllTrolley(String u_id) {
		// TODO Auto-generated method stub
		return trolleyDao.findAllTrolley(u_id);
	}
	
	@Override
	public void updateAmount(Trolley trolley) {
		// TODO Auto-generated method stub
		trolleyDao.updateAmount(trolley);
	}

	@Override
	public void insertTrolley(Trolley trolley) {
		// TODO Auto-generated method stub
		trolleyDao.insertTrolley(trolley);
	}
	
	@Override
	public void deleteTrolley(Trolley trolley) {
		// TODO Auto-generated method stub
		trolleyDao.deleteTrolley(trolley);
	}

	
	@Override
	public Commodity findCommodityByNo(String com_no) {
		// TODO Auto-generated method stub
		return commodityDao.findCommodityByNo(com_no);
	}

	@Override
	public Store findStoreById(int sto_no) {
		// TODO Auto-generated method stub
		return storeDao.findStoreById(sto_no);
	}

	@Override
	public void insertOrder(Orders order) {
		// TODO Auto-generated method stub
		orderDao.insertOrder(order);
	}

	@Override
	public int findOid(String o_no) {
		// TODO Auto-generated method stub
		return orderDao.findOid(o_no);
	}

	@Override
	public void insertOrderItem(Orderitem orderitem) {
		// TODO Auto-generated method stub
		orderDao.insertOrderItem(orderitem);
	}

}
