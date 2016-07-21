package com.journaldev.spring;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.journaldev.spring.model.Organization;
import com.journaldev.spring.model.Role;
import com.journaldev.spring.model.Role_power;
import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.OrganizationService;

@Controller
public class OrganizationController {
	
	private OrganizationService organizationService;
	private UserService userService;
	
	@Autowired(required=true)
	@Qualifier(value="organizationService")
	public void setOrganizationService(OrganizationService os){
		this.organizationService = os;
	}
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService as){
		this.userService = as;
	}
	 
   @RequestMapping(value = "/super/organization", method = RequestMethod.GET)
   
   public String listOrganizations(Model model) {
		model.addAttribute("organization", new Organization());
		model.addAttribute("listOrganizations", this.organizationService.listOrganizations());
		return "organization";
}
  
 //单位机构管理列表
   @RequestMapping(value = {"/admin/organization_list"}, method = RequestMethod.GET)   
   public String userOrganization_list(Model model) {
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
		model.addAttribute("listOrganizations", this.organizationService.listOrganizations());
		return "admin_organizations/organization_list";
   }
 //添加单位机构
   @RequestMapping(value ="/super/add/organization", method = RequestMethod.GET)
   public String addOrganization_admin(Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        //新建一个空的单位机构实体类
		model.addAttribute("organization", new Organization());
       return "admin_organizations/add_organization";
   }
 //发布单位机构
   @RequestMapping(value= "/super/save/organization", method = RequestMethod.POST)
   public String saveOrganization_admin(@ModelAttribute("organization") Organization organization, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        Random rand = new Random();
		int randNum1 = rand.nextInt(1000);
		int randNum2 = rand.nextInt(1000);
		String randStr1=Integer.toHexString(randNum1);
		String randStr2=Integer.toHexString(randNum2);
		//设置发布时间为服务器日期时间并规范
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
		organization.setId(randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2);
		//存入数据库
		this.organizationService.addOrganization(organization);
        return "submit_success/add_success";
   }
 //编辑单位机构
   @RequestMapping(value ="/super/edit/organization/{id}", method = RequestMethod.GET)
   public String editOrganization_admin(@PathVariable("id") String id, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        //获取编辑目标
        model.addAttribute("organization", this.organizationService.getOrganizationById(id));
       return "admin_organizations/edit_organization";
   }
 //更新单位机构
   @RequestMapping(value= "/super/update/organization", method = RequestMethod.POST)
   public String updateOrganization_admin(@ModelAttribute("organization") Organization organization, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
		this.organizationService.updateOrganization(organization);
        return "submit_success/edit_success";
   }
   
//删除单位机构
	@RequestMapping("/super/remove/organization/{id}")
    public String removeOrganization_admin(@PathVariable("id") String id){			
        this.organizationService.removeOrganization(id);
        return "submit_success/remove_success";
    }
   
	//For add and update organization both
	@RequestMapping(value= "/super/organization/add", method = RequestMethod.POST)
	public String addOrganization(@ModelAttribute("organization") Organization o){
		System.out.println(o.getName());
		if(o.getId() == null){
			Random rand = new Random();
			int randNum1 = rand.nextInt(10000);
			int randNum2 = rand.nextInt(10000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			o.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
			this.organizationService.addOrganization(o);
		}else{
			this.organizationService.updateOrganization(o);
		}
		
		return "redirect:/super/organization";
		
	}
	
	@RequestMapping("/super/organization/remove/{id}")
    public String removemOrganization(@PathVariable("id") String id){
		
        this.organizationService.removeOrganization(id);
        return "redirect:/super/organization";
    }
 
    @RequestMapping("/super/organization/edit/{id}")
    public String editorganization(@PathVariable("id") String id, Model model){
        model.addAttribute("organization", this.organizationService.getOrganizationById(id));
        model.addAttribute("listOrganizations", this.organizationService.listOrganizations());
        return "organization";
    }
}
