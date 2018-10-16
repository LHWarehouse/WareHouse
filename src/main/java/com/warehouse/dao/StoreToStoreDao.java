package com.warehouse.dao;

import java.util.List;

import com.warehouse.pojo.Goods;

public interface StoreToStoreDao
{
	//查询所有货物
	public List<Goods> selectAllGoods();
	//查询A点的货物
	public List<Goods> selectGoodsFromStoreA();
	//查询B店的货物
	public List<Goods> selectGoodsFromStoreB();
	//从商店A里查询是否有该货物
	public Integer SelectGoodsFromStoreAyId(String id);
	//更新店A中的货品数量
	public void updataGoodsFromStoreAbyId(Goods goods);
	//增加店A中的货品
	public void insertGoodsToStoreA(Goods goods);
	//从商店B里查询是否有该货物
	public Integer SelectGoodsFromStoreById(String id);
	//更新店B中的货品数量
	public void updataGoodsFromStoreBbyId(Goods goods);
	//增加店B中的货品
	public void insertGoodsToStoreB(Goods goods);
	//从商店b里面查询产品回显通过id
	public Goods selectGoodsFromStoreBbyID(Integer id);
	//从商店a里面查询产品回显通过id
	public Goods selectGoodsFromStoreAbyID(Integer id);
	//减少商店a的相应商品数量
	public void reduceGoodsFromStoreA(Goods goods);
	//减少商店a的相应商品数量
	public void reduceGoodsFromStoreB(Goods goods);
}
