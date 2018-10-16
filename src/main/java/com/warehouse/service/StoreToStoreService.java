package com.warehouse.service;

import java.util.List;

import com.warehouse.pojo.Goods;

public interface StoreToStoreService
{
	//查询仓库货品中的所有货品
	public List<Goods> SelectAllGoods();
	//从商店a中查询货品列表
	public List<Goods> SelectGoodsFromStoreA();
	//从商店b中查询货品列表
	public List<Goods> SelectGoodsFromStoreB();
	
	//从商店A里查询是否有该货物
	public Integer SelectGoodsFromStoreAyId(String id);
	//更新店A中的货品数量
	public void updataGoodsFromStoreAbyId(Goods goods);
	//怎加店A中的货品
	public void insertGoodsToStoreA(Goods goods);
	
	//从商店A里查询是否有该货物
	public Integer SelectGoodsFromStoreById(String id);
	//更新店A中的货品数量
	public void updataGoodsFromStoreBbyId(Goods goods);
	//怎加店A中的货品
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
