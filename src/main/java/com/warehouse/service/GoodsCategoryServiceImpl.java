package com.warehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.dao.GoodsCategoryDao;
import com.warehouse.pojo.GoodsCategory;

@Service
public class GoodsCategoryServiceImpl implements GoodsCategoryService
{

	@Autowired
	private GoodsCategoryDao goodsCategoryDao;

	public List<GoodsCategory> selectCategoryListByCode(String code)
	{
		return goodsCategoryDao.selectCategoryListByCode(code);
	}

}
