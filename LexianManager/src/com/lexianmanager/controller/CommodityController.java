package com.lexianmanager.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lexianmanager.po.*;
import com.lexianmanager.service.CommodityService;






@Controller
public class CommodityController {
	@Autowired 
	CommodityService commodityService;
	
	@RequestMapping("/index.action")
	public ModelAndView welcome() throws Exception {
		String com_no="6941499101219";
		CommodityInfoVo commodityInfoVo=commodityService.selectById(com_no);
		commodityInfoVo.setCom_no(com_no);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");		
		modelAndView.addObject("comVo",commodityInfoVo);
		return modelAndView;

	}
	@RequestMapping("/commodity.action")
public ModelAndView commodityDetail(HttpServletRequest request) throws Exception{
		String com_no=request.getParameter("com_no");
		CommodityInfoVo commodityInfoVo=commodityService.selectById(com_no);
		List<Commodity_store> commodity_storeList=commodityService.selectAllComByNo(com_no);
		List<Store> stoList=new ArrayList<Store>();
		for(Commodity_store com_sto:commodity_storeList) {
			Store store=new Store();
			store.setSto_add(commodityService.selectByNo(com_sto.getSto_no()).getSto_add());
			store.setSto_name(commodityService.selectByNo(com_sto.getSto_no()).getSto_name());
			stoList.add(store);
		}
		Commodity_storeDetailVo commodity_storeDetailVo=new Commodity_storeDetailVo();
		commodity_storeDetailVo.setCommodity_storeList(commodity_storeList);
		commodity_storeDetailVo.setStoList(stoList);
		commodity_storeDetailVo.setCommodityInfoVo(commodityInfoVo);
		ModelAndView modelAndView=new ModelAndView();
			modelAndView.setViewName("items/commodity");
			modelAndView.addObject("comDetail",commodity_storeDetailVo);
			
			System.out.println(commodity_storeDetailVo.getCommodityInfoVo().getCom_no());


		return modelAndView;
	
	
	}
}
