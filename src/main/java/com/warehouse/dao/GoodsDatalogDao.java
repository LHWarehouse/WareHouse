package com.warehouse.dao;

import java.util.List;

import com.warehouse.pojo.LogData;
import com.warehouse.pojo.LogDataInfor;
import com.warehouse.pojo.QueryVoLog;

public interface GoodsDatalogDao
{
	public List<LogData> selectFromType();
	
	//查找所有的datalog
	public List<LogDataInfor> selectAllLogData(QueryVoLog vo);
	//查找总条数
	public Integer logCountByQuery(QueryVoLog vo);
}
