package com.lexianmanager.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lexianmanager.po.CommodityShow;
import com.lexianmanager.po.CommodityVo;
import com.lexianmanager.service.CHCommodityService;

@Controller
public class CHCommodityController {
	@Autowired
	private CHCommodityService cHCommodityService;
	
	@RequestMapping("/findCommodityByName")
	public ModelAndView queryItems(HttpServletRequest request) throws Exception{
		//获取用户输入的关键字，封装进commodityVo中
		CommodityVo commodityVo = new CommodityVo();
		commodityVo.setCom_name(request.getParameter("com_name"));
		System.out.println(request.getParameter("com_name"));
		
		//调用service查找 数据库，查询商品列表
		List<CommodityShow> commodityShowList = new ArrayList<CommodityShow>();
		commodityShowList = cHCommodityService.findCommodityByName(commodityVo);
		System.out.println("commodityShowList!!!:" + commodityShowList);
		for(CommodityShow commodityShow : commodityShowList){
			commodityShow.setPictureurl(commodityShow.getPictureurl().substring(1));
		}
		System.out.println("commodityShowList:" + commodityShowList);

		System.out.println(commodityShowList);
		//返回ModelAndView
		ModelAndView modelAndView =  new ModelAndView();

		//指定视图
		modelAndView.setViewName("items/findCommodityByName");
		//相当 于request的setAttribut，在jsp页面中通过commodityList取数据
		modelAndView.addObject("commodityShowList", commodityShowList);
		
		return modelAndView;
	}
}
