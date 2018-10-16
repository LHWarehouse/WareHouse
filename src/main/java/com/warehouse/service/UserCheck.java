package com.warehouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.dao.LoginCheckDao;
import com.warehouse.pojo.AdminLoad;
import com.warehouse.pojo.UserLoad;

@Service
public class UserCheck
{
	@Autowired
	private LoginCheckDao loginCheckDao;
	
	//查询员工表中是否有该用户
	public Integer CheckUser(UserLoad user){
		return loginCheckDao.CheckUser(user);
	}
	//查询密码是否正确
	public UserLoad CheckPassword(UserLoad user){
		return loginCheckDao.CheckPassword(user);
	}
	public Integer CheckAdmin(AdminLoad admin){
		return loginCheckDao.CheckAdmin(admin);
	}
	public AdminLoad CheckAdminPassword(AdminLoad admin){
		return loginCheckDao.CheckAdminPassword(admin);
	}
}
