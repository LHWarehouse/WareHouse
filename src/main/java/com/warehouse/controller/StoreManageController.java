package com.warehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.pojo.Goods;
import com.warehouse.pojo.QueryVo;

import com.warehouse.service.GoodsAdministrationService;
import com.warehouse.service.StoreToStoreService;

@Controller
public class StoreManageController
{
	@Autowired
	private StoreToStoreService storeToStoreService;
	@Autowired
	private GoodsAdministrationService goodsAdministrationService;

	// 商店转入页面入口
	@RequestMapping("/jsp/store_manage")
	public String showStore(QueryVo vo, ModelMap map)
	{

		// 查仓库货物表 为页面提供数据
		List<Goods> page = storeToStoreService.SelectAllGoods();
		map.addAttribute("page", page);
		// 查询商店a b的货物列表数据
		List<Goods> storeA = storeToStoreService.SelectGoodsFromStoreA();
		List<Goods> storeB = storeToStoreService.SelectGoodsFromStoreB();
		map.addAttribute("storeA", storeA);
		map.addAttribute("storeB", storeB);
		return "store_manage";
	}

	// 以下全部用于回显数据
	@RequestMapping("jsp/StoreToStoreSelectQuery.action")
	@ResponseBody
	public Goods editgoods(Integer id)
	{
		return goodsAdministrationService.SelectGoodsById(id);
	}

	@RequestMapping("jsp/StoreToStoreSelectQueryFromB.action")
	@ResponseBody
	public Goods StoreToStoreSelectQueryFromB(Integer id)
	{
		return storeToStoreService.selectGoodsFromStoreBbyID(id);
	}

	@RequestMapping("jsp/StoreToStoreSelectQueryFromA.action")
	@ResponseBody
	public Goods StoreToStoreSelectQueryFromA(Integer id)
	{
		return storeToStoreService.selectGoodsFromStoreAbyID(id);
	}

	// 从仓库转入货品到A
	@RequestMapping("goods/WarehouseToStoreA.action")
	@ResponseBody
	public String WarehouseToStoreA(Goods goods)
	{
		goods.setGoods_total(goods.getGoods_status());
		// 判断店a里是否存在该货品
		int i = storeToStoreService.SelectGoodsFromStoreAyId(goods
				.getGoods_id());
		// 如果店a里有该货品
		if (i != 0)
		{
			// 修改店a里的货品数量
			storeToStoreService.updataGoodsFromStoreAbyId(goods);
			// 修改仓库里的货品数量
			goodsAdministrationService.outWarehouseUpdate(goods);
		} else
		{
			// 增加店a里的货品
			storeToStoreService.insertGoodsToStoreA(goods);
			// 修改仓库里的货品数量
			goodsAdministrationService.outWarehouseUpdate(goods);
		}
		return "ok";
	}

	// 从仓库转入货品到B
	@RequestMapping("goods/WarehouseToStoreB.action")
	@ResponseBody
	public String WarehouseToStoreB(Goods goods)
	{
		goods.setGoods_total(goods.getGoods_status());
		// 判断店b里是否存在该货品
		int i = storeToStoreService.SelectGoodsFromStoreById(goods
				.getGoods_id());
		// 如果店a里有该货品
		if (i != 0)
		{
			// 修改店B里的货品数量
			storeToStoreService.updataGoodsFromStoreBbyId(goods);
			// 修改仓库里的货品数量
			goodsAdministrationService.outWarehouseUpdate(goods);
		} else
		{
			// 增加店B里的货品
			storeToStoreService.insertGoodsToStoreB(goods);
			// 修改仓库里的货品数量
			goodsAdministrationService.outWarehouseUpdate(goods);
		}
		return "ok";
	}

	// 从商店b中转入获评到商店a
	@RequestMapping("goods/StoreBToStoreA.action")
	@ResponseBody
	public String StoreBToStoreA(Goods goods)
	{
		// 判断a货店里是否有从b转过来的商品id
		int i = storeToStoreService.SelectGoodsFromStoreAyId(goods
				.getGoods_id());
		// 如果有
		if (i != 0)
		{
			// 增加更新a货店里商品的数量
			storeToStoreService.updataGoodsFromStoreAbyId(goods);
			// 减少b货店里相应的商品数量
			storeToStoreService.reduceGoodsFromStoreB(goods);
			return "ok";
		}
		// 没有
		else
		{
			// 添加a货店里的商品
			storeToStoreService.insertGoodsToStoreA(goods);
			// 减少b货店里相应商品数量
			storeToStoreService.reduceGoodsFromStoreB(goods);
			return "ok";
		}
	}

	// 从商店a中转入获评到商店b
	@RequestMapping("goods/StoreAToStoreB.action")
	@ResponseBody
	public String StoreAToStoreB(Goods goods)
	{
		// 判断B货店里是否有从A转过来的商品id
		int i = storeToStoreService.SelectGoodsFromStoreById(goods
				.getGoods_id());
		// 如果有
		if (i != 0)
		{
			// 增加更新B货店里商品的数量
			storeToStoreService.updataGoodsFromStoreBbyId(goods);
			// 减少A货店里相应的商品数量
			storeToStoreService.reduceGoodsFromStoreA(goods);
			return "ok";
		}
		// 没有
		else
		{
			// 添加B货店里的商品
			storeToStoreService.insertGoodsToStoreB(goods);
			// 减少A货店里相应商品数量
			storeToStoreService.reduceGoodsFromStoreA(goods);
			return "ok";
		}
	}

}
