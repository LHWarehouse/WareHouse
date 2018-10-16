package com.warehouse.dao;

import java.sql.Date;

import com.warehouse.pojo.LogData;
import com.warehouse.pojo.LogDataInfor;

public interface GoodsLogDao
{	
	//查询改日期在表logdata中的行数
	public Integer SearchLogData(Date date);
	//插入logdata表中data字段
	public void insertLogData(Date date);
	
	public LogData searchData(Date date);
	
	//将logdatainfor插入日志信息表
		public void insertDataLog(LogDataInfor infor);
}
