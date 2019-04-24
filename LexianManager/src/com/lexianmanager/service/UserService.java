package com.lexianmanager.service;

import java.util.List;

import com.lexianmanager.po.*;


public interface UserService {
	User findInfo(int u_id);
	void updateInfo(UserInfoVo userInfoVo);
	List<OrdersQueryVo> selectAllOrderByU_id(int u_id);
	Store selectStoByNo(OrdersQueryVo ordersQueryVo);
	List<OrdersUserComListVo> selectOrderById(OrdersQueryVo ordersQueryVo);
	int selectIdByPhone(String u_phone);
}
