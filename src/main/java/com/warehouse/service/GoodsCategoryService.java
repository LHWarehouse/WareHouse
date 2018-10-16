package com.warehouse.service;

import java.util.List;

import com.warehouse.pojo.GoodsCategory;

public interface GoodsCategoryService
{
	public List<GoodsCategory> selectCategoryListByCode(String code);
}
