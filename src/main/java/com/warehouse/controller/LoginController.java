package com.warehouse.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.warehouse.pojo.AdminLoad;
import com.warehouse.pojo.UserLoad;
import com.warehouse.service.UserCheck;
/**
 * 
 * 登陆功能
 *
 */
@Controller
public class LoginController
{
	@Autowired
	private UserCheck userCheck;
	
	@RequestMapping("/")
	public String Welcome(){
		return "index";
	}
	
	@RequestMapping("index")
	public String LoginIn(){
		return "index";
	}
	
	@RequestMapping("indexAdmin")
	public String LoginAdminIn(){
		return "indexAdmin";
	}
	@RequestMapping("LoginCheck.action")
	public String LoginCheck(UserLoad user , ModelMap map ,HttpServletRequest request){
		//查询员工数据表检验用户
		
		//检验//查询数据库中是否有该用户名//查询数据库中密码是否正确
		int signal = userCheck.CheckUser(user);
		if(signal == 0){
			
			map.addAttribute("errorinformation", 0);
			return "forward:/index";
		}
		else{
			UserLoad payload =new UserLoad();
			payload = userCheck.CheckPassword(user);
			if(payload.getPassword().equals(user.getPassword()) == false){
				
				map.addAttribute("errorinformation",1);
				return "forward:/index";
			}
			//获取sesion对象 并将用户名存在session中一属性里
			HttpSession session = request.getSession();
			session.setAttribute("user", user.getUser());
			return "forward:/jsp/staff_manage";
		}
		
	}
	@RequestMapping("LoginAdminCheck.action")
	public String LoginAdminCheck(AdminLoad admin , ModelMap map , HttpServletRequest request){
		int signal = userCheck.CheckAdmin(admin);
		if(signal == 0){
			
			map.addAttribute("errorinformation", 0);
			return "forward:/indexAdmin";
		}
		else{
			AdminLoad payload =new AdminLoad();
			payload = userCheck.CheckAdminPassword(admin);
			if(payload.getPassword().equals(admin.getPassword()) == false){
				
				//此处换一个map对象看看
				map.addAttribute("errorinformation", 1);
				return "forward:/indexAdmin";
			}
			//获取sesion对象 并将用户名存在session中一属性里
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin.getAdmin());
			return "forward:/jsp/admin_manage";
		}
	}
	//员工等出
	@RequestMapping("/jsp/staff_logout")
	public String StaffLoginOut(HttpServletRequest request){
		// 取得session对象
    	HttpSession session = request.getSession();
    	
    	// 置空当前用户
    	session.setAttribute("user",""); 
    	return "index";
	}
	//员工等出
	@RequestMapping("/jsp/admin_logout")
	public String AdminLoginOut(HttpServletRequest request){
		// 取得session对象
	    HttpSession session = request.getSession();
	    	
	    // 置空当前用户
	    session.setAttribute("admin",""); 
	    return "forward:/indexAdmin";
	}	
}
