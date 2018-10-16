package com.warehouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.dao.GoodsAdministrationDao;
import com.warehouse.pojo.Goods;
import com.warehouse.pojo.LogDataInfor;
import com.warehouse.pojo.QueryVo;
import com.warehouse.utils.Page;

@Service
public class GoodsAdministrationServiceImpl implements
		GoodsAdministrationService
{
	@Autowired
	private GoodsAdministrationDao goodsAdministrationDao;

	public Page<Goods> SearchGoodsByQueryvO(QueryVo vo)
	{

		Page<Goods> page = new Page<Goods>();
		// 每页数
		vo.setSize(10);
		page.setSize(10);
		if (null != vo){
			// 判断当前页
			if (null != vo.getPage()){
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage() - 1) * vo.getSize());
			}
			if (null != vo.getGoodsId() && !"".equals(vo.getGoodsId().trim())){
				vo.setGoodsId(vo.getGoodsId().trim());
			}
			if (null != vo.getGoodsCategoryId()
					&& !"".equals(vo.getGoodsCategoryId().trim())){
				vo.setGoodsCategoryId(vo.getGoodsCategoryId().trim());
			}
			page.setTotal(goodsAdministrationDao.goodsCountByQueryVo(vo));
			page.setRows(goodsAdministrationDao.selectGoodsListByQueryVo(vo));
		}

		return page;
	}

	public Goods SelectGoodsById(Integer id){
		return goodsAdministrationDao.selectGoodsById(id);
	}


	public void updateGoods(Goods goods){
		goodsAdministrationDao.updateGoods(goods);
	}

	// 入库添加货品
	
	public void addGoods(Goods goods){
		goodsAdministrationDao.addGoods(goods);
	}

	// -----------------------功能暂时不用-------------------------//
	// 查询要加入的货品id是否在表中存在
	
	public Integer selectNewGoodsById(String id){
		Integer result = goodsAdministrationDao.selectNewGoodsById(id);
		return result;
	}

	public void updateGoodsNew(LogDataInfor log){
		goodsAdministrationDao.updateGoodsNew(log);
	}

	// -----------------------------------------------------------//


	public void inWarehouseUpdate(Goods goods){
		goodsAdministrationDao.inWarehouseUpdate(goods);
	}

	
	public void outWarehouseUpdate(Goods goods){
		goodsAdministrationDao.outWarehouseUpdate(goods);
	}

}
