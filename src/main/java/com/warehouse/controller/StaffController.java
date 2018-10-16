package com.warehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.warehouse.pojo.Goods;
import com.warehouse.pojo.GoodsCategory;
import com.warehouse.pojo.QueryVo;
import com.warehouse.service.GoodsAdministrationService;
import com.warehouse.service.GoodsCategoryService;
import com.warehouse.utils.Page;

@Controller
public class StaffController
{
	@Autowired
	private GoodsCategoryService goodsCategoryService;
	
	@Autowired
	private GoodsAdministrationService goodsAdministrationService;
	
	@RequestMapping("jsp/staff_manage")
	public String Staff(ModelMap map){
		
		List<GoodsCategory> fromType = goodsCategoryService
				.selectCategoryListByCode("001");

		map.addAttribute("fromType", fromType);
		return "staff_manage";
	}
	// 查询条件界面入口
		@RequestMapping("/jsp/stafflist.action")
		public String StaffGoodSearchList(QueryVo vo, ModelMap map)
		{

			// 页面加载时 准备在model里的Category的list<pojo> 取参数中的 Category_name值
			List<GoodsCategory> fromType = goodsCategoryService
					.selectCategoryListByCode("001");
			map.addAttribute("fromType", fromType);

			Page<Goods> page = goodsAdministrationService.SearchGoodsByQueryvO(vo);
			map.addAttribute("page", page);
			// 回显查询的条件
			map.addAttribute("goodsId", vo.getGoodsId());
			map.addAttribute("goods_category_id", vo.getGoodsCategoryId());

			return "staff_manage";
		}
}
