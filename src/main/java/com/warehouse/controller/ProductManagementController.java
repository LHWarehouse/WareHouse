package com.warehouse.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.pojo.Goods;
import com.warehouse.pojo.LogDataInfor;
import com.warehouse.pojo.QueryVo;
import com.warehouse.pojo.GoodsCategory;
import com.warehouse.service.GoodsAdministrationService;
import com.warehouse.service.GoodsCategoryService;
import com.warehouse.service.GoodsLogService;
import com.warehouse.utils.Page;

@Controller
public class ProductManagementController
{

	@Autowired
	private GoodsCategoryService goodsCategoryService;

	@Autowired
	private GoodsAdministrationService goodsAdministrationService;

	@Autowired
	private GoodsLogService goodsLogService;

	// 管理界面入口
	@RequestMapping("/jsp/admin_manage")
	public String GoodsList(ModelMap map)
	{

		// 页面加载时 准备在model里的Category的list<pojo> 取参数中的 Category_name值
		List<GoodsCategory> fromType = goodsCategoryService
				.selectCategoryListByCode("001");

		map.addAttribute("fromType", fromType);

		return "admin_manage";
	}

	// 查询条件界面入口
	@RequestMapping("/jsp/list.action")
	public String GoodSearchList(QueryVo vo, ModelMap map)
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

		return "admin_manage";
	}

	// 弹出修改页面时数据放在model中回显要的值
	@RequestMapping("/jsp/edit.action")
	@ResponseBody
	public Goods edit(Integer id)
	{

		return goodsAdministrationService.SelectGoodsById(id);
	}

	// 修改货品更新功能
	@RequestMapping("/goods/update.action")
	@ResponseBody
	public String update(Goods goods)
	{
		goodsAdministrationService.updateGoods(goods);
		return "ok";
	}

	// 货品入库url
	@RequestMapping("/goods/inWarehouse")
	@ResponseBody
	public String inWarehouse(Goods goods)
	{
		// 拼凑日志pojo类信息
		LogDataInfor logData = new LogDataInfor();
		// goods.setGoods_status(goods.getGoods_total());
		logData.setLog_goods_id(goods.getGoods_id());
		logData.setLog_goods_name(goods.getGoods_name());
		logData.setLog_goods_color(goods.getGoods_color());
		logData.setLog_goods_number(goods.getGoods_total());
		logData.setLog_goods_inorout(true);
		Date date = new java.sql.Date(new java.util.Date().getTime());
		java.sql.Timestamp time = new java.sql.Timestamp(
				new java.util.Date().getTime());
		// 查询logdata表中是否有data字段的行
		Integer result = goodsLogService.SearchLogData(date);
		// 如果返回值为0 插入logdata字段
		if (result == 0)
		{
			// 插入logdata表中data字段
			goodsLogService.insertLogData(date);
			// 插入后设置logDate里的log_goods_data属性
			logData.setLog_goods_data(goodsLogService.searchData(date)
					.getLogdata_order());
			// 设置logDate里的log_goods_daytime属性
			logData.setLog_goods_daytime(time);

		}
		// 如果大于0 则不插入
		else
		{
			// 设置logDate里的log_goods_data属性
			logData.setLog_goods_data(goodsLogService.searchData(date)
					.getLogdata_order());
			// 设置logDate里的log_goods_daytime属性
			logData.setLog_goods_daytime(time);
		}
		// 插入日志信息表
		goodsLogService.insertDataLog(logData);
		// 更新现有货品 的数量id
		goodsAdministrationService.inWarehouseUpdate(goods);

		return "ok";
	}

	// 货品出库url
	@RequestMapping("/goods/outWarehouse")
	@ResponseBody
	public String outWarehouse(Goods goods)
	{
		// 拼凑日志pojo类信息
		LogDataInfor logData = new LogDataInfor();
		// goods.setGoods_status(goods.getGoods_total());
		logData.setLog_goods_id(goods.getGoods_id());
		logData.setLog_goods_name(goods.getGoods_name());
		logData.setLog_goods_color(goods.getGoods_color());
		logData.setLog_goods_number(goods.getGoods_total());
		logData.setLog_goods_inorout(false);
		Date date = new java.sql.Date(new java.util.Date().getTime());
		java.sql.Timestamp time = new java.sql.Timestamp(
				new java.util.Date().getTime());
		// 查询logdata表中是否有data字段的行
		Integer result = goodsLogService.SearchLogData(date);
		// 如果返回值为0 插入logdata字段
		if (result == 0)
		{
			// 插入logdata表中data字段
			goodsLogService.insertLogData(date);
			// 插入后设置logDate里的log_goods_data属性
			logData.setLog_goods_data(goodsLogService.searchData(date)
					.getLogdata_order());
			// 设置logDate里的log_goods_daytime属性
			logData.setLog_goods_daytime(time);

		}
		// 如果大于0 则不插入
		else
		{
			// 设置logDate里的log_goods_data属性
			logData.setLog_goods_data(goodsLogService.searchData(date)
					.getLogdata_order());
			// 设置logDate里的log_goods_daytime属性
			logData.setLog_goods_daytime(time);
		}
		// 插入日志信息表
		goodsLogService.insertDataLog(logData);
		// 出库后 更新 total status
		goodsAdministrationService.outWarehouseUpdate(goods);
		return "ok";
	}
}
