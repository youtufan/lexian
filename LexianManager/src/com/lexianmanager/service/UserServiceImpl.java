package com.lexianmanager.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lexianmanager.dao.UserDao;
import com.lexianmanager.po.*;

@Service
public class UserServiceImpl implements UserService {
	@Autowired 
	UserDao userDao;
	@Override
	public User findInfo(int u_id) {
		
		return userDao.selectById(u_id);
	}
	@Override
	public void updateInfo(UserInfoVo userInfoVo) {
		userDao.updateUserInfo(userInfoVo);
		
	}
	@Override
	public List<OrdersQueryVo> selectAllOrderByU_id(int u_id) {
		List<OrdersQueryVo> ordersQueryVoList=new ArrayList<OrdersQueryVo>();
		List<Orders> ordersList=userDao.selectAllOrderByUid(u_id);
		for(Orders o:ordersList) {
			OrdersQueryVo ordersQueryVo=new OrdersQueryVo();
			ordersQueryVo.setO_id(o.getO_id());
			ordersQueryVo.setSto_no(o.getSto_no());
			ordersQueryVoList.add(ordersQueryVo);
		}
		return ordersQueryVoList;
	}
	@Override
	public Store selectStoByNo(OrdersQueryVo ordersQueryVo) {
		
		return userDao.selectStoreByNo(ordersQueryVo);
	}
	@Override
	public List<OrdersUserComListVo> selectOrderById(OrdersQueryVo ordersQueryVo) {
		List<OrdersUserComListVo> orderUserComListVoList=new ArrayList<OrdersUserComListVo>();
		List<Orderitem> orderitemList=userDao.selectOrderById(ordersQueryVo);
		for(Orderitem orderitem:orderitemList) {
		OrdersUserComListVo ordersUserComListVo=new OrdersUserComListVo();
		String com_no=orderitem.getCom_no();
		OrderitemVo orderitemVo=new OrderitemVo();
		orderitemVo.setCom_no(com_no);
		ordersUserComListVo.setCom_name(userDao.selectCommodityByNo(orderitemVo).getCom_name());
		String pictureurl=userDao.selectCommodityByNo(orderitemVo).getPictureurl().substring(1);
		ordersUserComListVo.setPictureurl(pictureurl);

		ordersUserComListVo.setAmount(orderitem.getAmount());
		ordersUserComListVo.setListprice(orderitem.getListprice());
		ordersUserComListVo.setOi_totalprice(orderitem.getOi_totalprice());
		orderUserComListVoList.add(ordersUserComListVo);
		}
		return orderUserComListVoList;
	}
	@Override
	public int selectIdByPhone(String u_phone) {
		return userDao.selectIdByPhone(u_phone);
	}


}
