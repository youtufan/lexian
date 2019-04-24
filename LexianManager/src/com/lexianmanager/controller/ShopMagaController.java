package com.lexianmanager.controller;

import java.io.BufferedReader;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lexianmanager.po.Commodity_store;
import com.lexianmanager.po.Commodity_storeQueryVo;
import com.lexianmanager.po.Store;
import com.lexianmanager.po.StoreManagerVo;
import com.lexianmanager.service.StoreQueryService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ShopMagaController {
	@Autowired
	StoreQueryService storeQueryService;

	@RequestMapping("/ShopMaga")
	public ModelAndView queryItems(HttpServletRequest request) throws Exception {

		List<Store> storeList = new ArrayList<Store>();
		storeList = storeQueryService.findAllStore(null);
		JSONArray json = new JSONArray();
		for (Store s : storeList) {
			JSONObject jo = new JSONObject();
			jo.put("sto_name", s.getSto_name());
			jo.put("sto_add", s.getSto_add());
			jo.put("sto_states", s.getSto_states());
			jo.put("sto_no", s.getSto_no());
			json.add(jo);
		}
		String jsonStr = json.toString();
		//System.out.println(jsonStr);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("items/shopMaga");
		modelAndView.addObject("shopjson", jsonStr);

		return modelAndView;

	}

	@RequestMapping("/updataSto")
	public void updateItems(HttpServletRequest request) throws Exception {
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

		StoreManagerVo storeManagerVo = new StoreManagerVo();
		storeManagerVo.setSto_no(jsonObj.get("ShopId").toString());
		storeManagerVo.setSto_name(jsonObj.get("editShopName").toString());
		storeManagerVo.setSto_add(jsonObj.get("editShopAddress").toString());
		storeManagerVo.setSto_states(Integer.parseInt(jsonObj.get("editShopStates").toString()));
		storeQueryService.updateStore(storeManagerVo);
	}

	@RequestMapping("/addSto")
	public void addItems(HttpServletRequest request) throws Exception {
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

		StoreManagerVo storeManagerVo = new StoreManagerVo();
		storeManagerVo.setSto_name(jsonObj.get("ShopName").toString());
		storeManagerVo.setSto_add(jsonObj.get("ShopAddress").toString());
		storeManagerVo.setSto_states(Integer.parseInt(jsonObj.get("ShopStates").toString()));
		storeQueryService.insertStore(storeManagerVo);

	}

	@RequestMapping(value = "/goodTable")
	public ModelAndView goodDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String Sto_no=request.getQueryString().substring(6);
		System.out.println(Sto_no);
		List<Commodity_storeQueryVo> commodity_storeQueryVoList = new ArrayList<Commodity_storeQueryVo>();
		List<Commodity_store> commodity_storeList = new ArrayList<Commodity_store>();
		Commodity_storeQueryVo commodity_storeQueryVo = new Commodity_storeQueryVo();
		commodity_storeQueryVo.setSto_no(Sto_no);
		commodity_storeList = storeQueryService.findStoreCommodity(commodity_storeQueryVo);
		for (Commodity_store c : commodity_storeList) {
			Commodity_storeQueryVo commodity_storeQueryVo1 = new Commodity_storeQueryVo();
			commodity_storeQueryVo1.setCom_no(c.getCom_no());
			commodity_storeQueryVo1.setCom_name(storeQueryService.findCommodityName(commodity_storeQueryVo1));
			commodity_storeQueryVo1.setCom_price(c.getCom_price());
			commodity_storeQueryVo1.setCom_amount(c.getCom_amount());
			commodity_storeQueryVo1.setType(c.getType());
			commodity_storeQueryVoList.add(commodity_storeQueryVo1);
		}

		JSONArray json1 = new JSONArray();
		for (Commodity_storeQueryVo co : commodity_storeQueryVoList) {
			JSONObject jo = new JSONObject();
			jo.put("com_no", co.getCom_no());
			jo.put("com_name", co.getCom_name());
			jo.put("com_price", co.getCom_price());
			jo.put("com_amount", co.getCom_amount());
			jo.put("type", co.getType());
			json1.add(jo);
		}
		String jsonStr1 = "" + json1.toString();
		System.out.println(jsonStr1);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("items/shopGoods-table");
		modelAndView.addObject("jsonStr1", jsonStr1);
		return modelAndView;

	}
	@RequestMapping("/updateCom")
	public void updateComItems(HttpServletRequest request) throws Exception {
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

/*		StoreManagerVo storeManagerVo = new StoreManagerVo();
		storeManagerVo.setSto_name(jsonObj.get("ShopId").toString());
		storeManagerVo.setSto_name(jsonObj.get("editShopName").toString());
		storeManagerVo.setSto_add(jsonObj.get("editShopAddress").toString());
		storeManagerVo.setSto_states(Integer.parseInt(jsonObj.get("editShopStates").toString()));
		storeQueryService.updateStore(storeManagerVo);*/
		Commodity_storeQueryVo commodity_storeQueryVo=new Commodity_storeQueryVo();
		commodity_storeQueryVo.setCom_no(jsonObj.get("GoodId").toString());
		commodity_storeQueryVo.setCom_name(jsonObj.get("editGoodName").toString());
		commodity_storeQueryVo.setCom_price(new BigDecimal(jsonObj.get("editGoodPrice").toString()));
		commodity_storeQueryVo.setCom_amount(Integer.parseInt(jsonObj.get("editGoodNum").toString()));
		commodity_storeQueryVo.setType(Integer.parseInt(jsonObj.get("editGoodStates").toString()));
		storeQueryService.updateCommodity(commodity_storeQueryVo);
	}

}
