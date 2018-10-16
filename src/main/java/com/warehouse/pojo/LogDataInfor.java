package com.warehouse.pojo;

import java.sql.Timestamp;





public class LogDataInfor
{
	private String log_goods_id;
	private String log_goods_name;
	private String log_goods_color;
	private Long log_goods_number;
	private Boolean log_goods_inorout;
	private Long log_goods_data;
	private Timestamp log_goods_daytime;
	public String getLog_goods_id()
	{
		return log_goods_id;
	}
	public void setLog_goods_id(String log_goods_id)
	{
		this.log_goods_id = log_goods_id;
	}
	public String getLog_goods_name()
	{
		return log_goods_name;
	}
	public void setLog_goods_name(String log_goods_name)
	{
		this.log_goods_name = log_goods_name;
	}
	public String getLog_goods_color()
	{
		return log_goods_color;
	}
	public void setLog_goods_color(String log_goods_color)
	{
		this.log_goods_color = log_goods_color;
	}
	public Long getLog_goods_number()
	{
		return log_goods_number;
	}
	public void setLog_goods_number(Long log_goods_number)
	{
		this.log_goods_number = log_goods_number;
	}
	public Boolean getLog_goods_inorout()
	{
		return log_goods_inorout;
	}
	public void setLog_goods_inorout(Boolean log_goods_inorout)
	{
		this.log_goods_inorout = log_goods_inorout;
	}
	public Long getLog_goods_data()
	{
		return log_goods_data;
	}
	public void setLog_goods_data(Long log_goods_data)
	{
		this.log_goods_data = log_goods_data;
	}
	public Timestamp getLog_goods_daytime()
	{
		return log_goods_daytime;
	}
	public void setLog_goods_daytime(Timestamp log_goods_daytime)
	{
		this.log_goods_daytime = log_goods_daytime;
	}
	
	
}
