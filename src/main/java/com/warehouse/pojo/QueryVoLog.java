package com.warehouse.pojo;

import java.sql.Date;

public class QueryVoLog
{
	//入参当前时间
	private Integer log_goods_data;
	
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer StartRow = 0;
	
	public Integer getPage()
	{
		return page;
	}
	public void setPage(Integer page)
	{
		this.page = page;
	}
	public Integer getSize()
	{
		return size;
	}
	public void setSize(Integer size)
	{
		this.size = size;
	}
	public Integer getStartRow()
	{
		return StartRow;
	}
	public void setStartRow(Integer startRow)
	{
		StartRow = startRow;
	}
	public Integer getLog_goods_data()
	{
		return log_goods_data;
	}
	public void setLog_goods_data(Integer log_goods_data)
	{
		this.log_goods_data = log_goods_data;
	}
	
	
}
