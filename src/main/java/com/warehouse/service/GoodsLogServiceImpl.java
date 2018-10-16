package com.warehouse.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.dao.GoodsLogDao;
import com.warehouse.pojo.LogData;
import com.warehouse.pojo.LogDataInfor;

@Service
public class GoodsLogServiceImpl implements GoodsLogService
{
	@Autowired
	private GoodsLogDao goodsLogDao;

	
	public Integer SearchLogData(Date date)
	{
		return goodsLogDao.SearchLogData(date);
	}


	public void insertLogData(Date date)
	{
		goodsLogDao.insertLogData(date);
	}


	public LogData searchData(Date date)
	{
		LogData data = new LogData();
		data = goodsLogDao.searchData(date);
		return data;
	}


	public void insertDataLog(LogDataInfor infor)
	{
		goodsLogDao.insertDataLog(infor);
		
	}

}
