package com.lexianmanager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lexianmanager.dao.ManagerDao;
import com.lexianmanager.dao.UserDao;
import com.lexianmanager.po.Manager;
import com.lexianmanager.po.ManagerQueryVo;
import com.lexianmanager.po.User;
import com.lexianmanager.po.UserQueryVo;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	UserDao userDao;
	
	@Autowired
	ManagerDao managerDao;
	
	@Override
	public User findUserByNameAndPwd(UserQueryVo userQueryVo) {
		// TODO Auto-generated method stub
		return userDao.selectByNameAndPwd(userQueryVo);
	}

	@Override
	public Manager findManagerByNameAndPwd(ManagerQueryVo managerQueryVo) {
		// TODO Auto-generated method stub
		return managerDao.selectByNameAndPwd(managerQueryVo);
	}

}
