package com.lexianmanager.dao;

import java.util.List;

import com.lexianmanager.po.Category;
import com.lexianmanager.po.Commodity;

public interface CategoryDao {
	List<Category> findCategoryByParent(int cat_id);
	List<Commodity> findCommodityByCatid(int cat_id);
}
