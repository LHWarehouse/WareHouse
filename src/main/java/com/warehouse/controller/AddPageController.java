package com.warehouse.controller;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.pojo.Goods;
import com.warehouse.pojo.GoodsCategory;
import com.warehouse.pojo.LogDataInfor;
import com.warehouse.service.GoodsAdministrationService;
import com.warehouse.service.GoodsCategoryService;
import com.warehouse.service.GoodsLogService;


@Controller
public class AddPageController
{
	@Autowired
	private GoodsCategoryService goodsCategoryService;
	@Autowired
	private GoodsAdministrationService goodsAdministrationService;
	@Autowired
	private GoodsLogService goodsLogService;

	// 新建货品页面
	@RequestMapping("/jsp/add_goods")
	public String AddGoodsPage(ModelMap map)
	{
		// 页面加载时 准备在model里的Category的list<pojo> 取参数中的 Category_name值
		List<GoodsCategory> fromType = goodsCategoryService
				.selectCategoryListByCode("001");
		map.addAttribute("fromType", fromType);
		return "add_goods";
	}

	// 新建货品更新
	@RequestMapping("/goods/addnew.action")
	@ResponseBody
	public String update(Goods goods)
	{
		// 拼凑日志pojo类信息
		LogDataInfor logData = new LogDataInfor();
		goods.setGoods_status(goods.getGoods_total());
		logData.setLog_goods_id(goods.getGoods_id());
		logData.setLog_goods_name(goods.getGoods_name());
		logData.setLog_goods_color(goods.getGoods_color());
		logData.setLog_goods_number(goods.getGoods_total());
		logData.setLog_goods_inorout(true);
		Date date = new java.sql.Date(new java.util.Date().getTime());
		java.sql.Timestamp time = new java.sql.Timestamp(new java.util.Date().getTime());
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
		// 查询datelog表 看是否货品id重复
		
		
		/*//---------------------------此功能有待改进----------------------------------//
		Integer i = goodsAdministrationService.selectNewGoodsById(logData
				.getLog_goods_id());
		// 如果有重复 即查询回来的返回值为1条
		if (i == 0)
		{
			// 插入货品表
			goodsAdministrationService.addGoods(goods);
		} else
		{
			// 增加货品表 更新total status的两个表值
			goodsAdministrationService.updateGoodsNew(logData);
		}*/
		
		
		// 插入货品表
		goodsAdministrationService.addGoods(goods);
		return "ok";
	}
	
	
	
	//检查货品id是否重复
	@RequestMapping("goods/checkgoods.action")
	@ResponseBody
	public String checkGoodsById(String id){
		String msg ; 
		Integer i = goodsAdministrationService.selectNewGoodsById(id);
		if (i == 1){
			return msg = "have_goods";
		}
		//MsgPojo msg = new MsgPojo();
		//msg.setMsg(i);
		return msg = "no_goods";
	}
	
}
