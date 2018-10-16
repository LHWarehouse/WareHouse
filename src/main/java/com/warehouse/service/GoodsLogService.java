package com.warehouse.service;

import java.sql.Date;

import com.warehouse.pojo.LogData;
import com.warehouse.pojo.LogDataInfor;

public interface GoodsLogService
{
	//查询改日期在表logdata中的行数
	public Integer SearchLogData(Date date);
	
	//在logdata表中插入data字段
	public void insertLogData(Date date);
	
	//在logdata中查询改时间data字段的时间编号返回值
	public LogData searchData(Date date);
	
	//将logdatainfor插入日志信息表
	public void insertDataLog(LogDataInfor infor);
	
}
