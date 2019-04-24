package com.lexianmanager.dao;

import java.util.List;

import com.lexianmanager.po.*;

public interface UserDao {
	User selectByNameAndPwd(UserQueryVo userQueryVo);
	User selectByPhone(User user);
	int updateUser(User user);
	List<User> findAllUser();
	void insertUser(User user);
	String getUserId(String u_phone);
	User selectById(int u_id);
	void updateUserInfo(UserInfoVo userInfoVo);
	List<Orders> selectAllOrderByUid(int u_id);
	Store selectStoreByNo(OrdersQueryVo ordersQueryVo);
	List<Orderitem> selectOrderById(OrdersQueryVo ordersQueryVo);
	Commodity selectCommodityByNo(OrderitemVo orderitemVo);
	int selectIdByPhone(String u_phone);
}
