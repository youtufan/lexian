package com.lexianmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lexianmanager.dao.CommodityDao;
import com.lexianmanager.dao.UserDao;
import com.lexianmanager.dao.OrderDao;
import com.lexianmanager.dao.StoreDao;
import com.lexianmanager.po.Commodity;
import com.lexianmanager.po.Orders;
import com.lexianmanager.po.Store;
import com.lexianmanager.po.User;

@Service
public class GetInformationServiceImpl implements GetInformationService {


	@Autowired
	UserDao userDao;
	
	@Autowired
	CommodityDao commodityDao;

	@Autowired
	OrderDao orderDao;
	
	@Autowired
	StoreDao storeDao;

	@Override
	public String getUserId(String u_phone) {
		// TODO Auto-generated method stub
		return userDao.getUserId(u_phone);
	}

	@Override
	public User findUserByPhone(User user) {
		// TODO Auto-generated method stub
		return userDao.selectByPhone(user);
	}
	
	@Override
	public int modifyByPhone(User user) {
		// TODO Auto-generated method stub
		return userDao.updateUser(user);
	}

	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return userDao.findAllUser();
	}
	
	@Override
	public List<Commodity> findAllCommodity() {
		// TODO Auto-generated method stub
		return commodityDao.findAllCommodity();
	}

	@Override
	public List<Store> findAllStore() {
		// TODO Auto-generated method stub
		return storeDao.findAllStore();
	}

	@Override
	public void insertCommodity(Commodity commodity) {
		// TODO Auto-generated method stub
		commodityDao.insertCommodity(commodity);
	}

	@Override
	public void deleteCommodity(String com_no) {
		// TODO Auto-generated method stub
		commodityDao.deleteCommodity(com_no);
	}

	@Override
	public String selectCommodityId(String com_no) {
		// TODO Auto-generated method stub
		return commodityDao.selectCommodityId(com_no);
	}

	@Override
	public void updateCommodity(Commodity commodity) {
		// TODO Auto-generated method stub
		commodityDao.updateCommodity(commodity);
	}
	
	@Override
	public List<Orders> findAllOrder() {
		// TODO Auto-generated method stub
		return orderDao.findAllOrder();
	}
	
	@Override
	public void updateOrderStates(String o_no,String paymenttype,String deliverytype,String o_states) {
		// TODO Auto-generated method stub
		orderDao.updateOrderStates(o_no,paymenttype,deliverytype,o_states);
	}
}
