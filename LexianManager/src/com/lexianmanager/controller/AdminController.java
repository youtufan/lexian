package com.lexianmanager.controller;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lexianmanager.po.Commodity;
import com.lexianmanager.po.User;
import com.lexianmanager.po.Orders;
import com.lexianmanager.po.Store;
import com.lexianmanager.service.GetInformationService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class AdminController {

	@Autowired
	GetInformationService getInformationService;

	// 通过phone获取用户信息
	@RequestMapping("/get")
	public ModelAndView getInformation(HttpServletRequest request) throws Exception {
		// 获取用户输入
		ModelAndView modelAndView = new ModelAndView();
		User user = new User();
		user.setU_phone(request.getParameter("u_phone"));
		user = getInformationService.findUserByPhone(user);

		modelAndView.setViewName("items/Information");
		modelAndView.addObject("loginedUser", user);
		return modelAndView;
	}

	// 修改用户信息
	@RequestMapping("/modify")
	public ModelAndView modify(HttpServletRequest request) throws Exception {
		// 获取用户输入
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		User user = new User();
		user.setU_phone(request.getParameter("u_phone"));
		user.setUsername(request.getParameter("username"));
		;
		user.setU_name(request.getParameter("u_name"));
		;
		user.setSex(request.getParameter("sex"));
		;
		user.setMail(request.getParameter("mail"));
		System.out.println(request.getParameter("username"));
		if (getInformationService.modifyByPhone(user) > 0) {
			modelAndView.setViewName("items/Information");
			modelAndView.addObject("xxx", "修改成功！");
		} else {
			modelAndView.setViewName("items/Information");
			modelAndView.addObject("xxx", "修改失败！");
		}
		user = getInformationService.findUserByPhone(user);
		modelAndView.addObject("loginedUser", user);

		return modelAndView;
	}

	//获取所有用户信息
	@RequestMapping("/admin_user")
	// 进入用户管理页面，同时获取所有用户信息
	public ModelAndView admin_user(HttpServletRequest request) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		// 调用service查找 数据库，查询用户列表
		List<User> userList = new ArrayList<User>();
		userList = getInformationService.findAllUser();

		String usersString = JSONArray.fromObject(userList).toString();

		modelAndView.addObject("usersString", usersString);
		modelAndView.setViewName("items/userMaga");
		return modelAndView;
	}

	// 冻结用户
	@RequestMapping("/freeze")
	public void freeze(HttpServletRequest request,HttpServletResponse response) throws Exception {
		// 获取用户输入
		request.setCharacterEncoding("utf-8");

		StringBuffer json = new StringBuffer();
		String lineString = null;
		try {
			BufferedReader reader = request.getReader();
			while ((lineString = reader.readLine()) != null) {
				json.append(lineString);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		JSONArray jsonArray = JSONArray.fromObject(json.toString());
		Object[] os = jsonArray.toArray();
		JSONObject jsonObj = JSONObject.fromObject(os[0]);

		User user = new User();
		user.setU_status(0);
		user.setU_phone(jsonObj.get("u_phone").toString());
		getInformationService.modifyByPhone(user);
		// 调用service查找 数据库，查询用户列表
		List<User> userList = new ArrayList<User>();
		userList = getInformationService.findAllUser();

		String usersString = JSONArray.fromObject(userList).toString();
		PrintWriter pw = response.getWriter();
		pw.write(usersString);
		pw.flush();
	}
	
	//获取所有店铺信息
	@RequestMapping("/admin_store")
	// 进入用户管理页面，同时获取所有用户信息
	public ModelAndView admin_store(HttpServletRequest request) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		// 调用service查找 数据库，查询店铺列表
		List<Store> storeList = new ArrayList<Store>();
		storeList = getInformationService.findAllStore();
		String storesList = JSONArray.fromObject(storeList).toString();

		modelAndView.addObject("storesList", storesList);

		modelAndView.setViewName("items/shopMaga");
		return modelAndView;
	}

	//获取所有商品信息
	@RequestMapping("/admin_commodity")
	// 进入商品管理页面，同时获取所有商品信息
	public ModelAndView admin_commodity(HttpServletRequest request) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		// 调用service查找 数据库，查询商品列表
		List<Commodity> commodityList = new ArrayList<Commodity>();
		commodityList = getInformationService.findAllCommodity();

		String commoditysString = JSONArray.fromObject(commodityList).toString();

		modelAndView.addObject("commoditysString", commoditysString);

		modelAndView.setViewName("items/commodity_table");
		return modelAndView;
	}
	
	//增添商品
	@RequestMapping("/add_commodity")
	// 新增商品信息
	public void add_commodity(HttpServletRequest request,HttpServletResponse response) throws Exception {

		
		StringBuffer json = new StringBuffer();
		String lineString = null;
		try {
			BufferedReader reader = request.getReader();
			while ((lineString = reader.readLine()) != null) {
				json.append(lineString);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		JSONArray jsonArray = JSONArray.fromObject(json.toString());
		Object[] os = jsonArray.toArray();
		JSONObject jsonObj = JSONObject.fromObject(os[0]);
		
		
		Commodity commodity = new Commodity();
		commodity.setCom_no(jsonObj.getString("com_no"));
		commodity.setCom_name(jsonObj.getString("com_name"));
		commodity.setCat_id(Integer.parseInt(jsonObj.getString("cat_id")));
		commodity.setIntroduce(jsonObj.getString("introduce"));
		commodity.setPictureurl(jsonObj.getString("pictureurl"));
		getInformationService.insertCommodity(commodity);
		
		
		// 调用service查找 数据库，查询商品列表
		List<Commodity> commodityList = new ArrayList<Commodity>();
		commodityList = getInformationService.findAllCommodity();

		String commoditysString = JSONArray.fromObject(commodityList).toString();
		System.out.println(commoditysString);
		System.out.println("2 1 16  2");
		PrintWriter pw = response.getWriter();
		pw.write(commoditysString);
		pw.flush();
	}
	
	//修改商品信息
	@RequestMapping("/edit_commodity")
	// 修改商品信息
	public void edit_commodity(HttpServletRequest request,HttpServletResponse response) throws Exception {

		
		StringBuffer json = new StringBuffer();
		String lineString = null;
		try {
			BufferedReader reader = request.getReader();
			while ((lineString = reader.readLine()) != null) {
				json.append(lineString);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		JSONArray jsonArray = JSONArray.fromObject(json.toString());
		Object[] os = jsonArray.toArray();
		JSONObject jsonObj = JSONObject.fromObject(os[0]);
		System.out.println(json.toString());
		String com_id = getInformationService.selectCommodityId(jsonObj.getString("oldcom_no"));
		
		Commodity commodity = new Commodity();
		commodity.setCom_id(Integer.parseInt(com_id));
		commodity.setCom_no(jsonObj.getString("com_no"));
		commodity.setCom_name(jsonObj.getString("com_name"));
		//commodity.setCat_id(Integer.parseInt(jsonObj.getString("cat_id")));
		commodity.setIntroduce(jsonObj.getString("introduce"));
		commodity.setPictureurl(jsonObj.getString("pictureurl"));
		getInformationService.updateCommodity(commodity);
		
		
		// 调用service查找 数据库，查询商品列表
		List<Commodity> commodityList = new ArrayList<Commodity>();
		commodityList = getInformationService.findAllCommodity();

		String commoditysString = JSONArray.fromObject(commodityList).toString();
		PrintWriter pw = response.getWriter();
		pw.write(commoditysString);
		pw.flush();
	}
	
	// 删除商品信息
	@RequestMapping("/delete_commodity")
	public void delete_commodity(HttpServletRequest request,HttpServletResponse response) throws Exception {

		
		StringBuffer json = new StringBuffer();
		String lineString = null;
		try {
			BufferedReader reader = request.getReader();
			while ((lineString = reader.readLine()) != null) {
				json.append(lineString);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		JSONArray jsonArray = JSONArray.fromObject(json.toString());
		Object[] os = jsonArray.toArray();
		JSONObject jsonObj = JSONObject.fromObject(os[0]);
		System.out.println(jsonObj.getString("com_no"));
		
		getInformationService.deleteCommodity(jsonObj.getString("com_no"));
		
		
		// 调用service查找 数据库，查询商品列表
		List<Commodity> commodityList = new ArrayList<Commodity>();
		commodityList = getInformationService.findAllCommodity();

		String commoditysString = JSONArray.fromObject(commodityList).toString();
		System.out.println(commoditysString);
		PrintWriter pw = response.getWriter();
		pw.write(commoditysString);
		pw.flush();

	}

	//获取所有订单列表
	@RequestMapping("/admin_order")
	// 进入商品管理页面，同时获取所有商品信息
	public ModelAndView admin_order(HttpServletRequest request) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		// 调用service查找 数据库，查询订单列表
		List<Orders> ordersList = new ArrayList<Orders>();
		ordersList = getInformationService.findAllOrder();

		String ordersString = JSONArray.fromObject(ordersList).toString();

		modelAndView.addObject("ordersString", ordersString);
		modelAndView.setViewName("items/order_table");
		return modelAndView;
	}

	// 发货
	@RequestMapping("/delivery")
	public void delivery(HttpServletRequest request,HttpServletResponse response) throws Exception {

			
			StringBuffer json = new StringBuffer();
			String lineString = null;
			try {
				BufferedReader reader = request.getReader();
				while ((lineString = reader.readLine()) != null) {
					json.append(lineString);
				}
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			JSONArray jsonArray = JSONArray.fromObject(json.toString());
			Object[] os = jsonArray.toArray();
			JSONObject jsonObj = JSONObject.fromObject(os[0]);
			System.out.println(json.toString());
			getInformationService.updateOrderStates(jsonObj.getString("o_no"),"线上支付","上门自提","已发货");
			
			// 调用service查找 数据库，查询订单列表
			List<Orders> ordersList = new ArrayList<Orders>();
			ordersList = getInformationService.findAllOrder();

			String ordersString = JSONArray.fromObject(ordersList).toString();
			PrintWriter pw = response.getWriter();
			pw.write(ordersString);
			pw.flush();

		}
	
	//返回登录界面
	@RequestMapping("/denglu")
	public ModelAndView denglu(HttpServletRequest request) throws Exception {
		//清空session信息
		request.getSession().removeAttribute("user");
		request.getSession().invalidate();
		// 退出
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("items/user_login");
		return modelAndView;
	}
	
	//返回注册界面
	@RequestMapping("/zhuce")
	public ModelAndView zhuce(HttpServletRequest request) throws Exception {
		//清空session信息
		request.getSession().removeAttribute("user");
		request.getSession().invalidate();
		// 退出
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("items/userReg");
		return modelAndView;
	}
	
	//返回首页界面
	@RequestMapping("/quit")
	public ModelAndView quit(HttpServletRequest request) throws Exception {
		//清空session信息
		request.getSession().removeAttribute("user");
		request.getSession().invalidate();
		// 退出
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("items/index");
		return modelAndView;
	}
}
