package com.lexianmanager.controller;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lexianmanager.po.*;

import com.lexianmanager.service.UserService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	@RequestMapping("/myHome")
	public ModelAndView myHome(HttpServletRequest request) throws Exception {
		String u_phone=request.getParameter("u_phone");
		System.out.println(u_phone);
		int u_id=userService.selectIdByPhone(u_phone);		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("users/myHome");
		modelAndView.addObject("u_id", u_id);

		return modelAndView;
	}
	@RequestMapping("/myInfo")
	public ModelAndView userInfo(HttpServletRequest request) throws Exception {
		
		int u_id=Integer.parseInt(request.getParameter("u_id"));
		System.out.println(u_id);
		UserInfoVo userInfoVo=new UserInfoVo();			
		User user=userService.findInfo(u_id);
		
		userInfoVo.setU_name(user.getU_name());
		userInfoVo.setU_phone(user.getU_phone());
		userInfoVo.setSex(user.getSex());
		userInfoVo.setMail(user.getMail());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("users/myInfo");
		modelAndView.addObject("userInfoVo", userInfoVo);

		return modelAndView;
	}
	@RequestMapping("/myOrder")
	public ModelAndView userOrder(HttpServletRequest request) throws Exception {
		int u_id=Integer.parseInt(request.getParameter("u_id"));
		System.out.println(u_id);
		List<OrdersQueryVo> ordersQueryVoList=userService.selectAllOrderByU_id(u_id);
		List<OrdersUserVo> orderUserVoList=new ArrayList<OrdersUserVo>();
		for(OrdersQueryVo o:ordersQueryVoList){
			OrdersUserVo ordersUserVo=new OrdersUserVo();
			int o_id=o.getO_id();
			String sto_no=o.getSto_no();
			OrdersQueryVo ordersQueryVo=new OrdersQueryVo();
			ordersQueryVo.setO_id(o_id);
			ordersQueryVo.setSto_no(sto_no);
			ordersUserVo.setSto_name(userService.selectStoByNo(ordersQueryVo).getSto_name());
			ordersUserVo.setSto_add(userService.selectStoByNo(ordersQueryVo).getSto_add());
			ordersUserVo.setOrdersUserComListVo(userService.selectOrderById(ordersQueryVo));
			orderUserVoList.add(ordersUserVo);			
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("orderUserVoList",orderUserVoList);
		modelAndView.setViewName("users/myOrder");
		return modelAndView;
	}
	
	@RequestMapping("/updateInfo")
	public void updateInfo(HttpServletRequest request) throws Exception {
		StringBuffer json = new StringBuffer();
		String lineString = null;
		BufferedReader reader = request.getReader();
		while ((lineString = reader.readLine()) != null) {
			json.append(lineString);
		}
		JSONArray jsonArray = JSONArray.fromObject(json.toString());
		Object[] os = jsonArray.toArray();
		JSONObject jsonObj = JSONObject.fromObject(os[0]);
		// System.out.println(jsonObj);
		UserInfoVo userInfoVo=new UserInfoVo();
		userInfoVo.setU_name(jsonObj.get("editMyName").toString());
		userInfoVo.setU_phone(jsonObj.get("editMyPhone").toString());
		userInfoVo.setSex(jsonObj.get("editMySex").toString());
		userInfoVo.setMail(jsonObj.get("editMyEmail").toString());
		

		userService.updateInfo(userInfoVo);
	
		
	}
	
	
	
	
	
	
}
