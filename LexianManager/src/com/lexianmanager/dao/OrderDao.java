package com.lexianmanager.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lexianmanager.po.Orderitem;
import com.lexianmanager.po.Orders;

public interface OrderDao {
	List<Orders> findAllOrder();
	void updateOrderStates(@Param("o_no") String o_no,@Param("paymenttype") String paymenttype,@Param("deliverytype") String deliverytype,@Param("o_states") String o_states);
	void insertOrder(Orders order);
	int findOid(String o_no);
	void insertOrderItem(Orderitem orderitem);
}
