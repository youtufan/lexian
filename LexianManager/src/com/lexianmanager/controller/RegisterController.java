package com.lexianmanager.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lexianmanager.po.Manager;
import com.lexianmanager.po.User;
import com.lexianmanager.service.*;

@Controller
public class RegisterController {

	@Autowired
	RegisterService registerService;

	@RequestMapping("/Mregister")
	public ModelAndView mRegister(HttpServletRequest request) throws Exception {
		// 判定用户是否已存在
		Manager manager1 = new Manager();
		manager1.setM_phone(request.getParameter("phe"));
		Manager manager = registerService.findByPhone(manager1);

		ModelAndView modelAndView = new ModelAndView();
		if (manager != null) {
			// 注册失败
			modelAndView.setViewName("items/reg");
			System.out.println("注册失败！！");
			modelAndView.addObject("fail", "注册失败！！");
		} else {
			// 注册成功
			Manager manager2 = new Manager();
			manager2.setM_phone(request.getParameter("phe"));
			manager2.setM_password(request.getParameter("pwd"));
			manager2.setSto_no(request.getParameter("num"));

			registerService.setManager(manager2);
			modelAndView.setViewName("items/admin_login");
		}

		return modelAndView;

	}

	@RequestMapping("/Uregister")
	public ModelAndView uRegister(HttpServletRequest request) throws Exception {
		// 判定用户是否已存在
		User user = new User();
		user.setU_phone(request.getParameter("u_phone"));
		User getuser = registerService.findByPhone(user);
		
		System.out.println(request.getParameter("pwd"));
		System.out.println(request.getParameter("checkpwd"));
		ModelAndView modelAndView = new ModelAndView();
		if (getuser != null) {
			// 注册失败
			modelAndView.setViewName("items/userReg");
			System.out.println("注册失败！！");
			modelAndView.addObject("fail", "账号已存在！！！");
		} else if (request.getParameter("pwd").equals(request.getParameter("checkpwd"))) {
			// 注册成功
			User user1 = new User();
			user1.setU_phone(request.getParameter("u_phone"));
			user1.setMail(request.getParameter("mail"));
			user1.setU_password(request.getParameter("pwd"));

			registerService.setUser(user1);
			modelAndView.setViewName("items/user_login");
		} else {// 注册失败
			modelAndView.setViewName("items/userReg");
			System.out.println("注册失败！！");
			modelAndView.addObject("fail", "密码输入不相同！！！");
		}

		return modelAndView;

	}

}
