package com.lexianmanager.service;

import org.springframework.stereotype.Service;

import com.lexianmanager.po.Manager;
import com.lexianmanager.po.ManagerQueryVo;
import com.lexianmanager.po.User;
import com.lexianmanager.po.UserQueryVo;

@Service
public interface LoginService {
	User findUserByNameAndPwd(UserQueryVo userQueryVo);
	Manager findManagerByNameAndPwd(ManagerQueryVo managerQueryVo);
}
