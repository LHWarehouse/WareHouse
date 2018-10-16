package com.warehouse.dao;

import java.util.List;

import com.warehouse.pojo.GoodsCategory;


public interface GoodsCategoryDao
{
	public List<GoodsCategory> selectCategoryListByCode(String code);
}
