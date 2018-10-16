package com.warehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.warehouse.pojo.LogData;
import com.warehouse.pojo.LogDataInfor;
import com.warehouse.pojo.QueryVoLog;
import com.warehouse.service.GoodsDatalogService;
import com.warehouse.utils.Page;

@Controller
public class GoodsDatalogController
{
	@Autowired
	private GoodsDatalogService goodsDatalogService;
	//页面跳转至日志页面
	@RequestMapping("/jsp/goods_datalog")
	public String GoodsDatalogPage(ModelMap map){
		//页面日志日期分类model数据准备
		List<LogData> fromType = goodsDatalogService.selectFromType() ;
		map.addAttribute("fromType", fromType);
		//Page<LogDataInfor> page = goodsDatalogService.selectAllLogData();
		return "goods_datalog";		
	}
	//查询日志信息url
	@RequestMapping("/jsp/lidsast.action")
	public String SearchDataLog(QueryVoLog vo ,ModelMap map){
		List<LogData> fromType = goodsDatalogService.selectFromType() ;
		map.addAttribute("fromType", fromType);
		Page<LogDataInfor> page = goodsDatalogService.selectAllLogData(vo);
		map.addAttribute("page", page);
		map.addAttribute("log_goods_data",vo.getLog_goods_data());
		
		return "goods_datalog";	
	}
}
