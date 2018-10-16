package com.warehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.dao.GoodsDatalogDao;
import com.warehouse.pojo.LogData;
import com.warehouse.pojo.LogDataInfor;
import com.warehouse.pojo.QueryVoLog;
import com.warehouse.utils.Page;

@Service
public class GoodsDatalogServiceImpl implements GoodsDatalogService
{

	@Autowired
	private GoodsDatalogDao goodsDatalogDao;


	public List<LogData> selectFromType()
	{
		return goodsDatalogDao.selectFromType();
	}

	public Page<LogDataInfor> selectAllLogData(QueryVoLog vo)
	{
		Page<LogDataInfor> page = new Page<LogDataInfor>();
		// 每页数
		vo.setSize(10);
		page.setSize(10);
		if (null != vo)
		{
			// 判断当前页
			if (null != vo.getPage())
			{
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage() - 1) * vo.getSize());
			}
			page.setTotal(goodsDatalogDao.logCountByQuery(vo));
			page.setRows(goodsDatalogDao.selectAllLogData(vo));
		}
		return page;
	}

}
