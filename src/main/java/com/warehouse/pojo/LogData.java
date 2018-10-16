package com.warehouse.pojo;

import java.sql.Date;

public class LogData
{
	private Long logdata_order;
	private Date logdata_data;
	public Long getLogdata_order()
	{
		return logdata_order;
	}
	public void setLogdata_order(Long logdata_order)
	{
		this.logdata_order = logdata_order;
	}
	public Date getLogdata_data()
	{
		return logdata_data;
	}
	public void setLogdata_data(Date logdata_data)
	{
		this.logdata_data = logdata_data;
	}
	
}
