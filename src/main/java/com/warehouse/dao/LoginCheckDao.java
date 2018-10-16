package com.warehouse.dao;

import com.warehouse.pojo.AdminLoad;
import com.warehouse.pojo.UserLoad;

public interface LoginCheckDao
{
	//查询员工表中是否有该用户
	public Integer CheckUser(UserLoad user);
	//查询密码是否正确
	public UserLoad CheckPassword(UserLoad user);
	//查询管理员表中是否有该用户
	public Integer CheckAdmin(AdminLoad admin);
	//查询密码是否正确
	public AdminLoad CheckAdminPassword(AdminLoad admin);
}
