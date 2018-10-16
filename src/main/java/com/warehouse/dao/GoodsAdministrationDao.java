package com.warehouse.dao;

import java.util.List;

import com.warehouse.pojo.LogDataInfor;
import com.warehouse.pojo.QueryVo;
import com.warehouse.pojo.Goods;

public interface GoodsAdministrationDao
{
	//总条数
	public Integer goodsCountByQueryVo(QueryVo vo);
	//结果集
	public List<Goods> selectGoodsListByQueryVo(QueryVo vo);
	
	//查询单个货品
	public Goods selectGoodsById(Integer id);
	
	//更新单个货品
	public void updateGoods(Goods goods);
	
	//入库添加货品
	public void addGoods(Goods goods);
	
	//----------功能不用
	//查询单个货品id
	public Integer selectNewGoodsById(String id);
	//入库货品 有相同id 更新货品的total status两个属性
	public void updateGoodsNew(LogDataInfor logDataInfor);
	//----------------------
	
	
	//入库现有货品更新total status两个属性
	public void inWarehouseUpdate(Goods goods);
	//出库现有货品更新total status两个属性
	public void outWarehouseUpdate(Goods goods);
	
	
}
