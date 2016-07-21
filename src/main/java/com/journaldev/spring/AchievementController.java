package com.journaldev.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.journaldev.spring.model.Achievement;
import com.journaldev.spring.model.Experiment;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random; 

import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.ExperimentService;
import com.journaldev.spring.service.PersonService;
import com.journaldev.spring.service.OrganizationService;
import com.journaldev.spring.service.AchievementService;

@Controller
public class AchievementController {
	
	private UserService userService;
	private PersonService personService;
	private OrganizationService organizationService;
	private ExperimentService experimentService;
	private AchievementService achievementService;
	

	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService as){
		this.userService = as;
	}
	@Autowired(required=true)
	@Qualifier(value="personService")
	public void setPersonService(PersonService ps){
		this.personService = ps;
	}	
	@Autowired(required=true)
	@Qualifier(value="organizationService")
	public void setOrganizationService(OrganizationService ps){
		this.organizationService = ps;
	}
	@Autowired(required=true)
	@Qualifier(value="experimentService")
	public void setExperimentService(ExperimentService ps){
		this.experimentService = ps;
	}
	@Autowired(required=true)
	@Qualifier(value="achievementService")
	public void setAchievementService(AchievementService ps){
		this.achievementService = ps;
	}

	//成果列表
	   @RequestMapping(value = {"/achievement_list"}, method = RequestMethod.GET)   
	   public String showExperiment_list(Model model) {
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			model.addAttribute("listAchievements", this.achievementService.listAchievements());
			return "show_achievements/achievement_list";
	   }
	   
	 //成果详情 
	   @RequestMapping(value ="/show/achievement/detail/{id}", method = RequestMethod.GET)
	   public String showExperiment_animal(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	       model.addAttribute("achievement", this.achievementService.getAchievementById(id));
	       return "show_achievements/show_achievement";
	   }
	 	//成果管理列表
	   @RequestMapping(value = {"/admin/achievement_list"}, method = RequestMethod.GET)   
	   public String showAchievement_list_admin(Model model) {
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			model.addAttribute("listAchievements", this.achievementService.listAchievements());
			return "admin_achievements/achievement_list";
	   }
	 //添加成果
	   @RequestMapping(value ="/admin/add/achievement", method = RequestMethod.GET)
	   public String addAchievement_admin(Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //新建一个空的公告实体类
			model.addAttribute("achievement", new Achievement());
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_achievements/add_achievement";
	   }
	 //发布成果
	   @RequestMapping(value= "/admin/save/achievement", method = RequestMethod.POST)
	   public String saveAchievement_admin(@ModelAttribute("achievement") Achievement achievement, Model model){
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
			//achievement.setTime(df.format(new Date()).toString());	
			achievement.setTime(df.format(new Date()));				
			//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
			achievement.setId(randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2);
			//设置发布人
			achievement.setIssuer(this.userService.getUserByName(name));
			//存入数据库
			this.achievementService.addAchievement(achievement);
	        return "submit_success/add_success";
	   }
	 //编辑成果
	   @RequestMapping(value ="/admin/edit/achievement/{id}", method = RequestMethod.GET)
	   public String editAchievement_admin(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //获取编辑目标
	        model.addAttribute("achievement", this.achievementService.getAchievementById(id));
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_achievements/edit_achievement";
	   }
	 //更新成果
	   @RequestMapping(value= "/admin/update/achievement", method = RequestMethod.POST)
	   public String updateAchievement_admin(@ModelAttribute("achievement") Achievement achievement, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			this.achievementService.updateAchievement(achievement);
	        return "submit_success/edit_success";
	   }
	   
	//删除成果
		@RequestMapping("/admin/remove/achievement/{id}")
	    public String removeAchievement_admin(@PathVariable("id") String id){			
	        this.achievementService.removeAchievement(id);
	        return "submit_success/remove_success";
	    }
		
	   
   @RequestMapping(value = "/super/achievement", method = RequestMethod.GET)
	   
	   public String listAchievements(Model model) {
			model.addAttribute("achievement", new Achievement());
			model.addAttribute("listUsers",this.userService.listUsers());
			model.addAttribute("listPersons",this.personService.listPersons());
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
			model.addAttribute("listExperiments",this.experimentService.listExperiments());
			model.addAttribute("listAchievements",this.achievementService.listAchievements());
			return "achievement";   
    }

  	//For add and update achievement both
	@RequestMapping(value= "/super/achievement/add", method = RequestMethod.POST)
	public String addAchievement(@ModelAttribute("achievement") Achievement p){
		
		if(p.getId() == null){
			Random rand = new Random();
			int randNum1 = rand.nextInt(10000);
			int randNum2 = rand.nextInt(10000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
			this.achievementService.addAchievement(p);
		}else{
			//existing achievement, call update
			this.achievementService.updateAchievement(p);
		}
		
		return "redirect:/super/achievement";
		
	}
	
	@RequestMapping("/super/achievement/remove/{id}")
    public String removeAchievement(@PathVariable("id") String id){
		
        this.achievementService.removeAchievement(id);
        return "redirect:/super/achievement";
    }
 
    @RequestMapping("/super/achievement/edit/{id}")
    public String editAchievement(@PathVariable("id") String id, Model model){
        model.addAttribute("achievement", this.achievementService.getAchievementById(id));
		model.addAttribute("listUsers",this.userService.listUsers());
		model.addAttribute("listPersons",this.personService.listPersons());
		model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
		model.addAttribute("listExperiments",this.experimentService.listExperiments());
		model.addAttribute("listAchievements",this.achievementService.listAchievements());
        return "achievement";
    }
    	
}
