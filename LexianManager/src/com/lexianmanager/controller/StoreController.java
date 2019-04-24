package com.lexianmanager.controller;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lexianmanager.po.Category;
import com.lexianmanager.po.Commodity;
import com.lexianmanager.po.CommodityShow;
import com.lexianmanager.po.CommodityVo;
import com.lexianmanager.po.CommodityWithStore;
import com.lexianmanager.po.Commodity_picture;
import com.lexianmanager.po.Orderitem;
import com.lexianmanager.po.Orders;
import com.lexianmanager.po.PageUtil;
import com.lexianmanager.po.Store;
import com.lexianmanager.po.Trolley;
import com.lexianmanager.service.CHCommodityService;
import com.lexianmanager.service.CategoryService;
import com.lexianmanager.service.GetInformationService;
import com.lexianmanager.service.StoreService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class StoreController {

	@Autowired
	GetInformationService getInformationService;

	@Autowired
	StoreService storeService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	private CHCommodityService cHCommodityService;

	// 通过phone获取用户购物车信息
	@RequestMapping("/getTrolley")
	public ModelAndView getInformation(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 获取购物车内信息
		String u_id = getInformationService.getUserId(request.getParameter("u_phone"));
		List<Trolley> trolleyList = storeService.findAllTrolley(u_id);
		List<CommodityWithStore> commodityList = new ArrayList<CommodityWithStore>();

		String trolleysString = JSONArray.fromObject(trolleyList).toString();
		JSONArray ja = JSONArray.fromObject(trolleyList);
		for (int i = 0; i < ja.size(); i++) {
			JSONObject jo = ja.getJSONObject(i);
			String com_no = jo.getString("com_no");
			String sto_no = jo.getString("sto_no");
			Commodity commodity = storeService.findCommodityByNo(com_no);
			Store store = storeService.findStoreById(Integer.parseInt(sto_no));
			CommodityWithStore commodityWithStore = new CommodityWithStore();
			commodityWithStore.setCom_name(commodity.getCom_name());
			commodityWithStore.setIntroduce(commodity.getIntroduce());
			commodityWithStore.setPictureurl(commodity.getPictureurl());
			commodityWithStore.setSto_name(store.getSto_name());
			commodityWithStore.setSto_add(store.getSto_add());
			commodityList.add(commodityWithStore);
		}
		String commoditysString = JSONArray.fromObject(commodityList).toString();

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("items/cart");
		modelAndView.addObject("trolleysString", trolleysString);
		modelAndView.addObject("commoditysString", commoditysString);
		return modelAndView;
	}

	@RequestMapping("/getProduct")
	public ModelAndView getProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 获取用户输入的关键字，封装进commodityVo中
		CommodityVo commodityVo = new CommodityVo();
		commodityVo.setCom_name(request.getParameter("com_name"));
		System.out.println(request.getParameter("com_name"));

		// 调用service查找 数据库，查询商品列表
		List<CommodityShow> commodityShowList = new ArrayList<CommodityShow>();
		commodityShowList = cHCommodityService.findCommodityByName(commodityVo);
		System.out.println("commodityShowList!!!:" + commodityShowList);
		for (CommodityShow commodityShow : commodityShowList) {
			commodityShow.setPictureurl(commodityShow.getPictureurl().substring(1));
		}
		System.out.println("commodityShowList:" + commodityShowList);

		System.out.println(commodityShowList);
		// 返回ModelAndView
		ModelAndView modelAndView = new ModelAndView();

		// 指定视图
		modelAndView.setViewName("items/product");
		// 相当 于request的setAttribut，在jsp页面中通过commodityList取数据
		modelAndView.addObject("commodityShowList", commodityShowList);
		return modelAndView;
	}

	@RequestMapping("/getUTrolley")
	public ModelAndView getUTrolley(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int size = Integer.parseInt(request.getParameter("size"));// 购物车内商品数量
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");// 设置日期格式
		String[] x = new String[size];
		double[] totalPrice = new double[size];
		int store_num = 0;// 不同门店的数量
		int com_num = 0;// 不同商品的数量
		// 取出不同门店的数量,不同门店对应的总额
		for (int i = 0; i < size; i++) {
			if (request.getParameter("checkboxx" + i) != null) {
				int j = 0;
				for (; j < size; j++) {
					if (request.getParameter("sto_no" + i).equals(x[j])) {
						totalPrice[j] += Double.parseDouble(request.getParameter("totalprice" + i).substring(1));
						break;
					}
				}
				if (j == size) {
					x[store_num] = request.getParameter("sto_no" + i);
					totalPrice[store_num] = Double.parseDouble(request.getParameter("totalprice" + i).substring(1));
					store_num++;
				}
			}
		}
		String u_id = getInformationService.getUserId(request.getSession().getAttribute("loginedUser").toString());
		// 传输至jsp
		List<Orderitem> orderitemList = new ArrayList<Orderitem>();
		List<Commodity_picture> commodity_pictureList = new ArrayList<Commodity_picture>();

		// 根据不同门店生成不同订单
		for (int i = 0; i < store_num; i++) {
			Orders orders = new Orders();
			orders.setO_no(df.format(new Date()) + u_id + i);
			orders.setU_id(Integer.parseInt(u_id));
			BigDecimal bd = new BigDecimal(totalPrice[i]);
			orders.setTotalamount(bd);
			orders.setO_states("未付款");
			orders.setSto_no(x[i]);
			storeService.insertOrder(orders);
			int o_id = storeService.findOid(orders.getO_no());

			for (int j = 0; j < size; j++) {
				if (request.getParameter("checkboxx" + j) != null && request.getParameter("sto_no" + j).equals(x[i])) {
					com_num++;
					Orderitem orderitem = new Orderitem();
					orderitem.setCom_no(request.getParameter("checkboxx" + j));
					orderitem.setO_id(o_id);
					orderitem.setAmount(Integer.parseInt(request.getParameter("amount" + j)));
					BigDecimal bd1 = new BigDecimal(
							Double.parseDouble(request.getParameter("listprice" + j).substring(1)));
					orderitem.setListprice(bd1);
					BigDecimal bd2 = new BigDecimal(
							Double.parseDouble(request.getParameter("totalprice" + j).substring(1)));
					orderitem.setOi_totalprice(bd2);
					storeService.insertOrderItem(orderitem);// 将订单内单个商品插入orderitem
					Commodity_picture commodity_picture = new Commodity_picture();
					commodity_picture.setCom_no(request.getParameter("checkboxx" + j));
					commodity_picture.setPicture_url(request.getParameter("pictureurl" + j));
					commodity_picture.setIntroduce(request.getParameter("introduce" + j));
					commodity_picture.setSto_name(request.getParameter("sto_name" + j));
					commodity_picture.setOrder_no(df.format(new Date()) + u_id + i);
					orderitemList.add(orderitem);
					commodity_pictureList.add(commodity_picture);

					// 将已结算的商品从购物车内移除
					/*
					 * System.out.println(request.getParameter("checkboxx"+j));
					 * System.out.println(u_id);
					 * System.out.println(request.getParameter("sto_no"+j));
					 * Trolley trolley = new Trolley();
					 * trolley.setCom_no(request.getParameter("checkboxx"+j));
					 * trolley.setU_id(u_id);
					 * trolley.setSto_no(request.getParameter("sto_no"+j));
					 * storeService.deleteTrolley(trolley);
					 */
				}
			}
		}
		String orderitemsString = JSONArray.fromObject(orderitemList).toString();
		String commodity_picturesString = JSONArray.fromObject(commodity_pictureList).toString();
		System.out.println(orderitemsString);
		System.out.println(commodity_picturesString);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("items/check");
		modelAndView.addObject("com_num", com_num);
		modelAndView.addObject("store_num", store_num);
		modelAndView.addObject("orderitemsString", orderitemsString);
		modelAndView.addObject("commodity_picturesString", commodity_picturesString);
		return modelAndView;
	}

	// 将商品加入购物车
	@RequestMapping("/insertTrolley")
	public ModelAndView insertTrolley(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(request.getParameter("u_phone"));
		// 获取购物车内信息
		String u_id = getInformationService.getUserId(request.getParameter("u_phone"));
		String com_no = request.getParameter("com_no");
		System.out.println(request.getParameter("amount"));
		System.out.println(com_no);
		List<Trolley> trolleyList = storeService.findAllTrolley(u_id);
		JSONArray ja = JSONArray.fromObject(trolleyList);
		int i = 0;// i=ja.size()时表示原购车无该类商品
		for (; i < ja.size(); i++) {
			JSONObject jo = ja.getJSONObject(i);
			String c_no = jo.getString("com_no");
			if (com_no.equals(c_no)) {
				Trolley trolley = new Trolley();
				trolley.setCom_no(request.getParameter("com_no"));
				trolley.setAmount(Integer.parseInt(request.getParameter("amount")));
				storeService.updateAmount(trolley);
				break;
			}
		}
		if (i == ja.size()) {
			Trolley trolley = new Trolley();
			trolley.setU_id(u_id);
			trolley.setCom_no(request.getParameter("com_no"));
			trolley.setSto_no(request.getParameter("sto_no"));
			trolley.setAmount(Integer.parseInt(request.getParameter("amount")));
			BigDecimal bd1 = new BigDecimal(Double.parseDouble(request.getParameter("listprice")));
			trolley.setListprice(bd1);
			BigDecimal bd2 = new BigDecimal(Integer.parseInt(request.getParameter("amount"))
					* Double.parseDouble(request.getParameter("listprice")));
			trolley.setTotalprice(bd2);
			storeService.insertTrolley(trolley);
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("items/index");
		return modelAndView;
	}

	// 用户提交订单
	@RequestMapping("/pay")
	public void pay(HttpServletRequest request, HttpServletResponse response) throws Exception {

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
		System.out.println(json.toString());
		JSONArray jsonArray = JSONArray.fromObject(json.toString());
		Object[] os = jsonArray.toArray();
		JSONObject jsonObj = JSONObject.fromObject(os[0]);

		int sto_num = Integer.parseInt(jsonObj.get("store_num").toString());
		for (int i = 0; i < sto_num; i++) {
			jsonObj = JSONObject.fromObject(os[i + 1]);
			getInformationService.updateOrderStates(jsonObj.getString("o_no"), "线上支付", "上门自提", "已付款");
		}
		PrintWriter pw = response.getWriter();
		pw.write(json.toString());
		pw.flush();
	}

	@RequestMapping("/checkDetail")
	public ModelAndView checkDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 获取用户输入的关键字，封装进commodityVo中
		CommodityVo commodityVo = new CommodityVo();
		commodityVo.setCom_name(request.getParameter("com_name"));
		System.out.println(request.getParameter("com_name"));

		// 调用service查找 数据库，查询商品列表
		List<CommodityShow> commodityShowList = new ArrayList<CommodityShow>();
		commodityShowList = cHCommodityService.findCommodityByName(commodityVo);
		System.out.println("commodityShowList!!!:" + commodityShowList);
		for (CommodityShow commodityShow : commodityShowList) {
			commodityShow.setPictureurl(commodityShow.getPictureurl().substring(1));
		}
		System.out.println("commodityShowList:" + commodityShowList);

		System.out.println(commodityShowList);
		// 返回ModelAndView
		ModelAndView modelAndView = new ModelAndView();

		// 指定视图
		modelAndView.setViewName("items/product");
		// 相当 于request的setAttribut，在jsp页面中通过commodityList取数据
		modelAndView.addObject("commodityShowList", commodityShowList);
		return modelAndView;
	}

	// 返回首页
	@RequestMapping("/returnIndex")
	public ModelAndView returnIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("items/index");
		return modelAndView;
	}

	// 用户通过分类栏查询商品
	@RequestMapping("/byCategory")
	public ModelAndView byCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<CommodityShow> commodityShowList = new ArrayList<CommodityShow>();
		List<CommodityShow> commodityShowList1 = new ArrayList<CommodityShow>();
		int cat_id = Integer.parseInt(request.getParameter("cat_id"));
		int type = Integer.parseInt(request.getParameter("type"));
		System.out.println(type);
		if (type == 2) {
			List<Category> categoryShowList = new ArrayList<Category>();// 搜索所有子类
			categoryShowList = categoryService.findCategoryByParent(cat_id);
			System.out.println("categoryShowList!!!:" + categoryShowList);
			for (Category category : categoryShowList) {
				List<Commodity> commodityList = new ArrayList<Commodity>();// 搜索所有子类对应的商品
				commodityList = categoryService.findCommodityByCatid(category.getCat_id());
				for (Commodity commodity : commodityList) {
					CommodityVo commodityVo = new CommodityVo();
					commodityVo.setCom_name(commodity.getCom_name());// 将搜索到的商品名放入搜索
					commodityShowList.addAll(cHCommodityService.findCommodityByName(commodityVo));
				}
			}
		} else if (type == 3) {
			List<Commodity> commodityList = new ArrayList<Commodity>();// 搜索所有子类对应的商品
			commodityList = categoryService.findCommodityByCatid(cat_id);
			for (Commodity commodity : commodityList) {
				CommodityVo commodityVo = new CommodityVo();
				commodityVo.setCom_name(commodity.getCom_name());// 将搜索到的商品名放入搜索
				commodityShowList.addAll(cHCommodityService.findCommodityByName(commodityVo));
			}
		}
		if (type == 1) {
			List<Category> categoryShowList2 = new ArrayList<Category>();// 搜索所有2级子类
			categoryShowList2 = categoryService.findCategoryByParent(cat_id);
			for (Category category2 : categoryShowList2) {
				List<Category> categoryShowList = new ArrayList<Category>();// 搜索所有3级子类
				categoryShowList = categoryService.findCategoryByParent(category2.getCat_id());
				for (Category category : categoryShowList) {
					List<Commodity> commodityList = new ArrayList<Commodity>();// 搜索所有子类对应的商品
					commodityList = categoryService.findCommodityByCatid(category.getCat_id());
					for (Commodity commodity : commodityList) {
						CommodityVo commodityVo = new CommodityVo();
						commodityVo.setCom_name(commodity.getCom_name());// 将搜索到的商品名放入搜索
						commodityShowList.addAll(cHCommodityService.findCommodityByName(commodityVo));
					}
				}
			}
		}

		System.out.println("commodityShowList!!!:" + commodityShowList);
		for (CommodityShow commodityShow : commodityShowList) {
			commodityShow.setPictureurl(commodityShow.getPictureurl().substring(1));
		}

		int pageIndex = 1;// 设置初始的当前页，页面显示的都是第一页
		int pageSize = 10;// 设置每一页显示几条数据,用于计算总页数，此处设置的值必须与sql语句的limit最后的数值一样
		PageUtil pageUtil = new PageUtil();// 初始化工具类
		if (request.getParameter("pageIndex") != null) {
			pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
		} // 对页面上的分页标签传的值,进行获取,也是就点击'上一页或者下一页'传过来的pageindex
		pageUtil.setPageIndex(pageIndex);// 保存至工具类
		int number = commodityShowList.size();// 计算出总数据量，就是多少条数据.
		pageUtil.setCat_id(cat_id);
		pageUtil.setType(type);
		pageUtil.setPageNumber(number);// 保存至工具类
		pageUtil.setPageSize(pageSize);// 保存至工具类
		int pageCount = number % pageSize == 0 ? number / pageSize : number / pageSize + 1;
		pageUtil.setPageCount(pageCount);// 计算出总页数,并封装到工具类
		int index = (pageIndex - 1) * pageSize;

		for (int i = index; i < index + pageSize&&i<number; i++) {
			commodityShowList1.add(commodityShowList.get(i));
		}

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("commodityShowList", commodityShowList1);
		modelAndView.addObject("pageUtil", pageUtil);
		modelAndView.setViewName("items/product");
		return modelAndView;
	}

	@RequestMapping("/page")
	public ModelAndView page(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<CommodityShow> commodityShowList = new ArrayList<CommodityShow>();
		System.out.println(request.getParameter("commodityShowList"));
		int pageIndex = 1;// 设置初始的当前页，页面显示的都是第一页
		int pageSize = 10;// 设置每一页显示几条数据,用于计算总页数，此处设置的值必须与sql语句的limit最后的数值一样
		PageUtil pageUtil = new PageUtil();// 初始化工具类
		if (request.getParameter("pageIndex") != null) {
			pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
		} // 对页面上的分页标签传的值,进行获取,也是就点击'上一页或者下一页'传过来的pageindex
		System.out.println(pageIndex);
		pageUtil.setPageIndex(pageIndex);// 保存至工具类
		int number = commodityShowList.size();// 计算出总数据量，就是多少条数据.
		pageUtil.setPageNumber(number);// 保存至工具类
		pageUtil.setPageSize(pageSize);// 保存至工具类
		int pageCount = number % pageSize == 0 ? number / pageSize : number / pageSize + 1;
		System.out.println(number);
		System.out.println(pageCount);
		pageUtil.setPageCount(pageCount);// 计算出总页数,并封装到工具类
		int index = (pageIndex - 1) * pageSize;

		/*for (int i = index; i < index + pageSize; i++) {
			commodityShowList1.add(commodityShowList.get(i));
		}*/
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("items/product");
		modelAndView.addObject("pageUtil", pageUtil);
		return modelAndView;
	}

}
