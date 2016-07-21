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

import com.journaldev.spring.model.Power;
import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.PowerService;

@Controller
public class PowerController {
	
	private PowerService powerService;
	private UserService userService;
	
	@Autowired(required=true)
	@Qualifier(value="powerService")
	public void setPowerService(PowerService os){
		this.powerService = os;
	}
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService as){
		this.userService = as;
	}
	 
   @RequestMapping(value = "/super/power", method = RequestMethod.GET)
   
   public String listPowers(Model model) {
		model.addAttribute("power", new Power());
		model.addAttribute("listPowers", this.powerService.listPowers());
		return "power";
}
  
 //权限管理列表
   @RequestMapping(value = {"/admin/power_list"}, method = RequestMethod.GET)   
   public String userPower_list(Model model) {
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
		model.addAttribute("listPowers", this.powerService.listPowers());
		return "admin_powers/power_list";
   }
 //添加权限
   @RequestMapping(value ="/super/add/power", method = RequestMethod.GET)
   public String addPower_admin(Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        //新建一个空的权限实体类
		model.addAttribute("power", new Power());
       return "admin_powers/add_power";
   }
 //发布权限
   @RequestMapping(value= "/super/save/power", method = RequestMethod.POST)
   public String savePower_admin(@ModelAttribute("power") Power power, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        //存入数据库
		this.powerService.addPower(power);
        return "submit_success/add_success";
   }
 //编辑权限
   @RequestMapping(value ="/super/edit/power/{id}", method = RequestMethod.GET)
   public String editPower_admin(@PathVariable("id") int id, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
        //获取编辑目标
        model.addAttribute("power", this.powerService.getPowerById(id));
       return "admin_powers/edit_power";
   }
 //更新权限
   @RequestMapping(value= "/super/update/power", method = RequestMethod.POST)
   public String updatePower_admin(@ModelAttribute("power") Power power, Model model){
		//获取当前登录的用户账号
		String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
		//以当前登录的用户账号查询用户实体类，并返回Model
        model.addAttribute("user", this.userService.getUserByName(name));
		this.powerService.updatePower(power);
        return "submit_success/edit_success";
   }   
//删除权限
	@RequestMapping("/super/remove/power/{id}")
    public String removePower_admin(@PathVariable("id") int id){			
        this.powerService.removePower(id);
        return "submit_success/remove_success";
    }
//获取权限id、pid和name列表
	@RequestMapping("/admin/getPower")
	@ResponseBody
    public List<Object[]> getPower_list(){			
    	List<Object[]> power_list=this.powerService.listPower_ztree();
        return power_list;
    }  
	
	
}
