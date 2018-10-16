package com.warehouse.pojo;

public class QueryVo
{
	//客户名称
	private String goodsId;
	private String goodsCategoryId;
	
	
	//当前页
	private Integer page ;
	//每页数
	private Integer size = 10;
	//开始行
	private Integer StartRow = 0;
	
	public Integer getStartRow()
	{
		return StartRow;
	}
	public void setStartRow(Integer startRow)
	{
		StartRow = startRow;
	}
	public Integer getPage()
	{
		return page;
	}
	public void setPage(Integer page)
	{
		this.StartRow = (page -1)*size;
		this.page = page;
	}
	public Integer getSize()
	{
		return size;
	}
	public void setSize(Integer size)
	{
		//this.StartRow = (page -1)*size;
		this.size = size;
	}
	
	public String getGoodsId()
	{
		return goodsId;
	}
	public void setGoodsId(String goodsId)
	{
		this.goodsId = goodsId;
	}
	public String getGoodsCategoryId()
	{
		return goodsCategoryId;
	}
	public void setGoodsCategoryId(String goodsCategoryId)
	{
		this.goodsCategoryId = goodsCategoryId;
	}
	
	
}
