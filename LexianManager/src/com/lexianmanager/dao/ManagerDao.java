package com.lexianmanager.dao;

import com.lexianmanager.po.Manager;
import com.lexianmanager.po.ManagerQueryVo;

public interface ManagerDao {
	Manager selectByNameAndPwd(ManagerQueryVo managerQueryVo);
	void insertManager(Manager manager);
	Manager selectByPhone(Manager manager);
}
