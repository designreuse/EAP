package com.journaldev.spring;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.spring.model.Collection;
import com.journaldev.spring.model.Technology;
import com.journaldev.spring.service.UserService;
import com.journaldev.spring.service.CollectionService;
import com.journaldev.spring.service.TechnologyService;
import com.journaldev.spring.service.PersonService;
import com.journaldev.spring.service.OrganizationService;

@Controller
public class TechnologyController {
	
	private TechnologyService technologyService;
	private UserService userService;
	private PersonService personService;
	private OrganizationService organizationService;
	private CollectionService collectionService;
	
	@Autowired(required=true)
	@Qualifier(value="technologyService")
	public void setTechnologyService(TechnologyService ans){
		this.technologyService = ans;
	}
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService as){
		this.userService = as;
	}
	@Autowired(required=true)
	@Qualifier(value="personService")
	public void setPersonService(PersonService as){
		this.personService = as;
	}
	@Autowired(required=true)
	@Qualifier(value="organizationService")
	public void setOrganizationService(OrganizationService ps){
		this.organizationService = ps;
	}
	@Autowired(required=true)
	@Qualifier(value="collectionService")
	public void setCollectionService(CollectionService collection){
		this.collectionService = collection;
	}

	//技术服务列表
	   @RequestMapping(value = {"/technology_list"}, method = RequestMethod.GET)   
	   public String showExperimental_animal_list(Model model) {
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			model.addAttribute("listTechnologys", this.technologyService.listTechnologys());
			model.addAttribute("numberTechnologys", this.technologyService.listTechnologys().size());
			return "show_technologys/technology_list";
	   }	   
	 //技术服务详情 
	   @RequestMapping(value ="/show/technology/detail/{id}", method = RequestMethod.GET)
	   public String showExperimental_animal(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        model.addAttribute("technology", this.technologyService.getTechnologyById(id));
			model.addAttribute("list_jsfw",this.collectionService.anybodycollection("jsfw")); 
			model.addAttribute("collection", new Collection());
	       return "show_technologys/show_technology";
	   }	
	 //技术服务管理列表
	   @RequestMapping(value = {"/admin/technology_list"}, method = RequestMethod.GET)   
	   public String userAnnouncement_list(Model model) {
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			model.addAttribute("listTechnologys", this.technologyService.listTechnologys());
			return "admin_technologys/technology_list";
	   }
	 //添加技术服务
	   @RequestMapping(value ="/admin/add/technology", method = RequestMethod.GET)
	   public String addTechnology_admin(Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //新建一个空的公告实体类
			model.addAttribute("technology", new Technology());
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_technologys/add_technology";
	   }
	 //发布技术服务
	   @RequestMapping(value= "/admin/save/technology", method = RequestMethod.POST)
	   public String saveTechnology_admin(@ModelAttribute("technology") Technology technology, Model model){
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
			technology.setTime(df.format(new Date()));	
			//设置ID为UUID去掉"-"后首尾混合两个1000以内的随机数并转化成16进制
			technology.setId(randStr1+java.util.UUID.randomUUID().toString().replaceAll("-","")+randStr2);
			//设置发布人
			technology.setIssuer(this.userService.getUserByName(name));
			//存入数据库
			this.technologyService.addTechnology(technology);
	        return "admin_technologys/add_success";
	   }
	 //编辑技术服务
	   @RequestMapping(value ="/admin/edit/technology/{id}", method = RequestMethod.GET)
	   public String editTechnology_admin(@PathVariable("id") String id, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
	        //获取编辑目标
	        model.addAttribute("technology", this.technologyService.getTechnologyById(id));
			//单位列表
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
	       return "admin_technologys/edit_technology";
	   }
	 //更新技术服务
	   @RequestMapping(value= "/admin/update/technology", method = RequestMethod.POST)
	   public String updateTechnology_admin(@ModelAttribute("technology") Technology technology, Model model){
			//获取当前登录的用户账号
			String name = SecurityContextHolder.getContext().getAuthentication().getName(); 
			//以当前登录的用户账号查询用户实体类，并返回Model
	        model.addAttribute("user", this.userService.getUserByName(name));
			this.technologyService.updateTechnology(technology);
	        return "admin_technologys/edit_success";
	   }
	   
	//删除技术服务
		@RequestMapping("/admin/remove/technology/{id}")
	    public String removeTechnology_admin(@PathVariable("id") String id){			
	        this.technologyService.removeTechnology(id);
	        return "admin_technologys/remove_success";
	    }
	
	
   @RequestMapping(value = "/show/technology/{page}", method = RequestMethod.GET)
   public String showTechnologys(@PathVariable("page") int page, Model model) {
		model.addAttribute("technology", new Technology());
		model.addAttribute("showTechnologys", this.technologyService.listTechnologys((page-1)*10,10));
		model.addAttribute("listUsers",this.userService.listUsers());
		return "show_technology";
}
 
   
   @RequestMapping(value = "/super/technology", method = RequestMethod.GET)
	   
	   public String listTechnologys(Model model) {
			model.addAttribute("technology", new Technology());
			model.addAttribute("listTechnologys", this.technologyService.listTechnologys());
			model.addAttribute("listUsers",this.userService.listUsers());
			model.addAttribute("listPersons",this.personService.listPersons());
			model.addAttribute("listOrganizations",this.organizationService.listOrganizations());
			return "technology";   
    }


  	//For add and update Technology both
	@RequestMapping(value= "/super/technology/add", method = RequestMethod.POST)
	public String addTechnology(@ModelAttribute("technology") Technology p){
		
		if(p.getId() == null){
			Random rand = new Random();
			int randNum1 = rand.nextInt(10000);
			int randNum2 = rand.nextInt(10000);
			String randStr1=Integer.toHexString(randNum1);
			String randStr2=Integer.toHexString(randNum2);
			p.setId(randStr1+java.util.UUID.randomUUID().toString()+randStr2);
			this.technologyService.addTechnology(p);
		}else{
			this.technologyService.updateTechnology(p);
		}
		
		return "redirect:/super/technology";
		
	}
	
	@RequestMapping("/super/technology/remove/{id}")
    public String removeTechnology(@PathVariable("id") String id){
		
        this.technologyService.removeTechnology(id);
        return "redirect:/super/technology";
    }
 
    @RequestMapping("/super/technology/edit/{id}")
    public String editTechnology(@PathVariable("id") String id, Model model){
        model.addAttribute("technology", this.technologyService.getTechnologyById(id));
        model.addAttribute("listTechnologys", this.technologyService.listTechnologys());
		model.addAttribute("listUsers",this.userService.listUsers());
        return "technology";
    }
    
    @RequestMapping(value = "/admin/technology/{org_id}/{page}", method = RequestMethod.GET)
    
    public String listExperimental_animals_admin(@PathVariable("page") int page,@PathVariable("org_id") String org_id, Model model)  {
 		model.addAttribute("listUsers",this.userService.listUsers());
 		//model.addAttribute("showTechnologys", this.technologyService.listTechnologys((page-1)*15,15,org_id));
 		//model.addAttribute("numberExperimental_animals", this.technologyService.listTechnologys((page-1)*15,15,org_id).size());
 		return "experimental_animal";   
 }
    @RequestMapping("/amdin/technology/create")
    public String createTechnology_admin(Model model){
		model.addAttribute("technology", new Technology());
        model.addAttribute("listUsers", this.userService.listUsers());
        return "add_technology";
    }

	@RequestMapping(value= "/amdin/technology/update/{id}", method = RequestMethod.POST)
	public String updateTechnology_admin(@PathVariable("id") @ModelAttribute("technology") String id, Technology p, Model model){
        model.addAttribute("technology", this.technologyService.getTechnologyById(id));
		this.technologyService.updateTechnology(p);
		return "redirect:/amdin/technology/edit/"+id;
	}

    @RequestMapping("/amdin/technology/edit/{id}")
    public String editExperimental_animal_admin(@PathVariable("id") String id, Model model){
        model.addAttribute("technology", this.technologyService.getTechnologyById(id));
        return "update_technology";
    }
    
//    @RequestMapping("/show/technology/detail/{id}")
//    public String detailTechnology(@PathVariable("id") String id, Model model){
//        model.addAttribute("technology", this.technologyService.getTechnologyById(id));
//		model.addAttribute("listUsers",this.userService.listUsers());
//		model.addAttribute("list_jsfw",this.collectionService.anybodycollection("jsfw")); 
//		model.addAttribute("collection", new Collection());
//        return "show_technology_detail";
//    }
    	
    @RequestMapping(value = "/select/technology/ti{title_info}/sp{species_info}/ab{abstract_info}/cy{cycle_info}/{page}", method = RequestMethod.GET)
    
    public String selectExperimental_animals(@PathVariable("page") int page,@PathVariable("title_info") String title_info,@PathVariable("species_info") String species_info,@PathVariable("abstract_info") String abstract_info,@PathVariable("cycle_info") String cycle_info, Model model) {
 		model.addAttribute("technology", new Technology());
 		model.addAttribute("listTechnologys",this.technologyService.listTechnologys()); 
 		if(title_info.length() <= 0 && species_info.length() <= 0 && abstract_info.length() <= 0 && cycle_info.length() <= 0)
 		{
 			model.addAttribute("showTechnologys", this.technologyService.listTechnologys((page-1)*15,15));
 			model.addAttribute("numberTechnologys", this.technologyService.listTechnologys().size());			
 			model.addAttribute("page_now",page); 
 		}
 		else
 		{
 			model.addAttribute("showTechnologys", this.technologyService.selectTechnologys((page-1)*15,15,title_info,species_info,abstract_info,cycle_info));
 			model.addAttribute("numberTechnologys", this.technologyService.Number_selectTechnologys(title_info,species_info,abstract_info,cycle_info));
 			model.addAttribute("page_now",page); 
 			model.addAttribute("title_info_now",title_info); 
 			model.addAttribute("species_info_now",species_info); 
 			model.addAttribute("abstract_info_now",abstract_info); 
 			model.addAttribute("cycle_info_now",cycle_info); 
 		}
 		return "show_select_technology";
    }
}
