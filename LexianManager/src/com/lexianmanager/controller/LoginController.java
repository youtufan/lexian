package com.lexianmanager.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lexianmanager.po.ManagerQueryVo;
import com.lexianmanager.po.Manager;
import com.lexianmanager.po.User;
import com.lexianmanager.po.UserQueryVo;
import com.lexianmanager.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	LoginService loginService;
	
	@RequestMapping("/userlogin")
	public ModelAndView queryItems(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//获取用户输入
		UserQueryVo userQueryVo = new UserQueryVo();
		userQueryVo.setPhone(request.getParameter("u_phone"));
		userQueryVo.setPassword(request.getParameter("u_pwd"));
		
		//调用service查找 数据库，查询用户
		User user = loginService.findUserByNameAndPwd(userQueryVo);
		ModelAndView modelAndView =  new ModelAndView();
		
		if(user != null){
			//登录成功
			modelAndView.setViewName("items/index");
			modelAndView.addObject("loginedUser",user);
			//将用户信息存到session
			HttpSession session = request.getSession(true);
			session.setAttribute("loginedUser",user.getU_phone());
			//记住账号密码
			if(request.getParameter("passcookie")!=null)
			{
				Cookie c1 = new Cookie("u_phone",userQueryVo.getPhone());
				Cookie c2 = new Cookie("u_pwd",userQueryVo.getPassword());
				c1.setMaxAge(10000);
				c2.setMaxAge(10000);
				response.addCookie(c1);
				response.addCookie(c2);
			}
		}else{
			//登录失败，到登录页
			modelAndView.setViewName("items/user_login");
			modelAndView.addObject("fail","登录失败！");
		}
		return modelAndView;
	}
	
	@RequestMapping("/managerlogin")
	public ModelAndView queryManagerItems(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//获取管理员输入
		ManagerQueryVo managerQueryVo = new ManagerQueryVo();
		managerQueryVo.setM_phone(request.getParameter("m_phone"));
		managerQueryVo.setM_password(request.getParameter("m_pwd"));
		
		//调用service查找 数据库，查询管理员
		Manager manager = loginService.findManagerByNameAndPwd(managerQueryVo);
		ModelAndView modelAndView =  new ModelAndView();

		if(manager != null){
			//登录成功，到后台首页
			modelAndView.setViewName("items/admin_main");
			modelAndView.addObject("loginedManager",manager);
			//记住账号密码
			if(request.getParameter("passcookie")!=null)
			{
				Cookie c1 = new Cookie("m_phone",managerQueryVo.getM_phone());
				Cookie c2 = new Cookie("m_pwd",managerQueryVo.getM_password());
				c1.setMaxAge(10000);
				c2.setMaxAge(10000);
				response.addCookie(c1);
				response.addCookie(c2);
			}
			//将用户信息存到session
		}else{
			//登录失败，到登录页
			modelAndView.setViewName("items/admin_login");
			modelAndView.addObject("fail","登录失败！");
		}
		
		
		return modelAndView;
	}
	
}
