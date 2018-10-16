package com.warehouse.service;

import java.util.List;

import com.warehouse.pojo.LogData;
import com.warehouse.pojo.LogDataInfor;
import com.warehouse.pojo.QueryVoLog;
import com.warehouse.utils.Page;

public interface GoodsDatalogService
{
	//取logdata中的表信息
	public List<LogData> selectFromType();

	public Page<LogDataInfor> selectAllLogData(QueryVoLog vo);
}
