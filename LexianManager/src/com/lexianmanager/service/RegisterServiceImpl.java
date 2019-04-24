package com.lexianmanager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lexianmanager.dao.ManagerDao;
import com.lexianmanager.dao.UserDao;
import com.lexianmanager.po.Manager;
import com.lexianmanager.po.User;


@Service
public class RegisterServiceImpl implements RegisterService {
	

	@Autowired
	ManagerDao managerDao;
	
	@Autowired
	UserDao userDao;
	
	@Override
	public Manager findByPhone(Manager manager) {
		
		return managerDao.selectByPhone(manager);
	}

	@Override
	public void setManager(Manager manager) {
		managerDao.insertManager(manager);
		
	}

	@Override
	public User findByPhone(User user) {
		// TODO Auto-generated method stub
		return userDao.selectByPhone(user);
	}

	@Override
	public void setUser(User user) {
		// TODO Auto-generated method stub
		userDao.insertUser(user);
	}

}
