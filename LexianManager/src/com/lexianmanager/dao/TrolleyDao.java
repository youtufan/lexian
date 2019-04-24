package com.lexianmanager.dao;

import java.util.List;

import com.lexianmanager.po.Trolley;

public interface TrolleyDao {
	List<Trolley> findAllTrolley(String u_id);
	void updateAmount(Trolley trolley);
	void insertTrolley(Trolley trolley);
	void deleteTrolley(Trolley trolley);
}
