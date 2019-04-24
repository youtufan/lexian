package com.lexianmanager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lexianmanager.po.CommodityDetailShow;
import com.lexianmanager.po.CommodityDetailVo;
import com.lexianmanager.service.CommodityDetailService;

@Controller
public class CommodityDetailController {
	@Autowired
	private CommodityDetailService commodityDetailService;

	@RequestMapping("/findCommodityDetail")
	public ModelAndView queryItems(HttpServletRequest request) throws Exception{
	String com_no = request.getParameter("com_no");
	System.out.println(com_no);
	CommodityDetailVo commodityDetailVo = new CommodityDetailVo();
	commodityDetailVo.setCom_no(com_no);
	List<CommodityDetailShow> commodityDetailShowList = commodityDetailService.viewCommodityDetail(commodityDetailVo);
	ModelAndView modelAndView =  new ModelAndView();
	System.out.println(commodityDetailShowList);
	modelAndView.setViewName("items/findCommodityDetail");
	modelAndView.addObject("commodityDetailShowList", commodityDetailShowList);
	
	return modelAndView;
	}
	
	
	
	
	

}
