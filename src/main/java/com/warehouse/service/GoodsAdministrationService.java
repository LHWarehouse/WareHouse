package com.warehouse.service;


import com.warehouse.pojo.Goods;
import com.warehouse.pojo.LogDataInfor;
import com.warehouse.pojo.QueryVo;
import com.warehouse.utils.Page;

public interface GoodsAdministrationService
{
	//查询货品列表
	public Page<Goods> SearchGoodsByQueryvO(QueryVo VO);
	//查询单个货品信息存model中 在前台页面使用
	public Goods SelectGoodsById(Integer id);
	//更新货品数据信息
	public void updateGoods(Goods goods);
	//入库添加货品
	public void addGoods(Goods goods);
	
	//-------------------------目前 下面这两个功能在后来需求分析后用不到了------------------//
	//查询单个货品id
	public Integer selectNewGoodsById(String id);
	//入库货品 有相同id 更新货品的total status两个属性
	public void updateGoodsNew(LogDataInfor log);
	//--------------------------------------------------------------------------------//
	
	
	//入库现有货品时 更新货品两个属性total status
	public void inWarehouseUpdate(Goods goods);
	//出库现有货品时 更新货品两个属性total status
	public void outWarehouseUpdate(Goods goods);
}
