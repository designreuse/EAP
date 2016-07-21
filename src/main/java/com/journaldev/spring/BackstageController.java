package com.journaldev.spring;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.method.P;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.FileService;

@Controller
public class BackstageController {
	private UserService userService;
	
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService as){
		this.userService = as;
	}
	
	//超级管理员的后台主页
	@RequestMapping("/super/index")
    public String super_index(Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        return "backstage_super/index";
        
    }	
	//普通管理员的后台主页
	@RequestMapping("/admin/index")
    public String user_index(Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        return "backstage_admin/index";
        
    }

	
	//修改成功弹出框
	@RequestMapping("/admin/edit_success")
    public String edit_success(Model model){		
        return "submit_success/edit_success";
        
    }	
	@RequestMapping("/super/index_backstage")
    public String index_backstage(Model model){
        return "index_backstage";
        
    }
	
	@RequestMapping("/super/index_backstage/{id}")
    public String super_index_backstage(@PathVariable("id") String id, Model model){

        model.addAttribute("user", this.userService.getUserById(id));
        if(this.userService.getUserById(id).getAuthority().equals("SUPER"))
        {
        	return "index_backstage_super";
        }
        else{
        	return "index";
        }
    }	
	@RequestMapping("/admin/index/{id}")
    public String user_index(@PathVariable("id") String id, Model model){

        model.addAttribute("user", this.userService.getUserById(id));
        if(this.userService.getUserById(id).getAuthority().equals("USER"))
        {
        	return "index_admin";
        }
        else{
        	return "index";
        }
    }
}
