package com.lexianmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lexianmanager.dao.CategoryDao;
import com.lexianmanager.po.Category;
import com.lexianmanager.po.Commodity;

@Service
public class CategoryServiceImpl implements CategoryService {



	@Autowired
	CategoryDao categoryDao;
	
	
	@Override
	public List<Category> findCategoryByParent(int cat_id) {
		// TODO Auto-generated method stub
		return categoryDao.findCategoryByParent(cat_id);
	}

	@Override
	public List<Commodity> findCommodityByCatid(int cat_id) {
		// TODO Auto-generated method stub
		return categoryDao.findCommodityByCatid(cat_id);
	}

}
