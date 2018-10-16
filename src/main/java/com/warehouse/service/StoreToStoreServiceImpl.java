package com.warehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.dao.StoreToStoreDao;
import com.warehouse.pojo.Goods;

@Service
public class StoreToStoreServiceImpl implements StoreToStoreService
{
	@Autowired
	private StoreToStoreDao storeToStoreDao;

	public List<Goods> SelectAllGoods(){
		return storeToStoreDao.selectAllGoods();
	}


	public List<Goods> SelectGoodsFromStoreA(){
		return storeToStoreDao.selectGoodsFromStoreA();
	}


	public List<Goods> SelectGoodsFromStoreB(){
		return storeToStoreDao.selectGoodsFromStoreB();
	}

	public Integer SelectGoodsFromStoreAyId(String id){
		return storeToStoreDao.SelectGoodsFromStoreAyId(id);
	}

	public void updataGoodsFromStoreAbyId(Goods goods){
		storeToStoreDao.updataGoodsFromStoreAbyId(goods);
	}
	public void insertGoodsToStoreA(Goods goods){
		storeToStoreDao.insertGoodsToStoreA(goods);
	}

	public Integer SelectGoodsFromStoreById(String id){	
		return storeToStoreDao.SelectGoodsFromStoreById(id);
	}

	public void updataGoodsFromStoreBbyId(Goods goods){
		storeToStoreDao.updataGoodsFromStoreBbyId(goods);	
	}

	public void insertGoodsToStoreB(Goods goods){
		storeToStoreDao.insertGoodsToStoreB(goods);
	}



	public Goods selectGoodsFromStoreBbyID(Integer id)
	{
		return storeToStoreDao.selectGoodsFromStoreBbyID(id);
	}


	
	public Goods selectGoodsFromStoreAbyID(Integer id)
	{
		
		return storeToStoreDao.selectGoodsFromStoreAbyID(id);
	}



	public void reduceGoodsFromStoreA(Goods goods)
	{
		
		storeToStoreDao.reduceGoodsFromStoreA(goods);
	}



	public void reduceGoodsFromStoreB(Goods goods)
	{
		storeToStoreDao.reduceGoodsFromStoreB(goods);
		
	}

}
