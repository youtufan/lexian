package com.lexianmanager.service;

import org.springframework.stereotype.Service;

import com.lexianmanager.po.Manager;
import com.lexianmanager.po.User;

@Service
public interface RegisterService {
		void setManager(Manager manager);
		Manager findByPhone(Manager manager);
		User findByPhone(User user);
		void setUser(User user);
}
